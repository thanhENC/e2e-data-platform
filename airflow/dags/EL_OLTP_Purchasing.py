from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator
from datetime import datetime 
from airflow.providers.ssh.operators.ssh import SSHOperator

import logging
from airflow.providers.slack.hooks.slack_webhook import SlackWebhookHook
from airflow.utils.state import State


def _construct_message(context):
    """
    Constructs a Slack message using the context from an Airflow task.

    Args:
        context (dict): The context dictionary from an Airflow task.

    Returns:
        str: The constructed Slack message.
    """
    task_instance = context.get("task_instance")
    failed_tasks = [
        ti.task_id
        for ti in task_instance.get_dagrun().get_task_instances()
        if ti.state == State.FAILED
    ]
    failed_tasks_list = " ".join([f"`{task}`" for task in failed_tasks])


    msg = """
    :red_circle: *FAILURE ALERT* 

    - *Dag*: {dag}
    - *Failed Tasks*: {failed_tasks_list}
    - *Execution Date Time*: {exec_date}
    """.format(
        dag=task_instance.dag_id,
        exec_date=context.get("execution_date"),
        failed_tasks_list=failed_tasks_list,
    )

    return msg


def send_failure_alert(context: dict):
    """
    Sends a job failure alert to Slack using the provided context from an Airflow task.

    Args:
        context (dict): The context dictionary from an Airflow task.
    """
    try:
        slack_msg = _construct_message(context)
        SlackWebhookHook(http_conn_id="slack_conn_id", message=slack_msg).execute()
    except Exception as e:
        logging.error(f"Error while sending alert: {e}")

default_args = {
    'start_date': datetime(2024, 1, 1),
    'catchup': False
}

source_schema = {
    "schema": "purchasing",
    "tables": [
        "productvendor",
        "purchaseorderdetail",
        "purchaseorderheader",
        "shipmethod",
        "vendor"
    ]
}

dag = DAG(
    f'spark-el-oltp-{source_schema["schema"]}',
    default_args=default_args,
    schedule_interval='@once',
)

# Dictionary to store task references
tasks = {}
s_schema = source_schema['schema']

# Loop through the tables in the schema
for i, s_table in enumerate(source_schema['tables']):
    py_app = f'EL_OLTP_{s_schema[:2]}_{s_table}.py'
    
    # Create the SSH command string
    ssh_command = f'''
    docker exec spark-master bash -c 'spark-submit \
        --master spark://spark-master:7077 \
        --executor-cores 1 \
        --executor-memory 1g \
        --driver-cores 1 \
        --driver-memory 1g \
        /opt/spark-apps/EL_OLTP/{s_schema}/EL_OLTP_{s_schema[:2]}.py {s_schema} {s_table}'
    '''

    # Define the SSH task using SSHOperator
    task = SSHOperator(
        task_id=f'sparksubmit_{s_table}',
        ssh_conn_id='ssh_spark_adw14',
        command=ssh_command,
        cmd_timeout=3600,
        dag=dag,
    )

    # Store task reference in the dictionary
    tasks[s_table] = task

    # Set task dependencies
    if i > 0:
        previous_table = source_schema['tables'][i - 1]
        tasks[s_table].set_upstream(tasks[previous_table])


    
# Source:
# s_schema = 'humanresources'
# s_table = 'department'
# py_app = f'EL_OLTP_{s_schema[:2]}_{s_table}.py'

# ssh_command = f'''
# docker exec spark-master bash -c 'spark-submit \
#     --master spark://spark-master:7077 \
#     --executor-cores 1 \
#     --executor-memory 1g \
#     --driver-cores 1 \
#     --driver-memory 1g \
#     /opt/spark-apps/{py_app}'
# '''

# ssh_spark_submit_task = SSHOperator(
#     task_id='ssh_spark_submit_task',
#     ssh_conn_id='ssh_spark_adw14',
#     command=ssh_command,
#     cmd_timeout=3600,
#     dag=dag,
# )
