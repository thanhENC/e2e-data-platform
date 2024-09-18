from airflow import DAG
from datetime import datetime 
from airflow.providers.ssh.operators.ssh import SSHOperator

import logging
from airflow.providers.slack.hooks.slack_webhook import SlackWebhookHook
from airflow.utils.state import State

default_args = {
    'start_date': datetime(2024, 1, 1),
    'catchup': False
}

dag = DAG(
    'delta-create-schema',
    default_args=default_args,
    schedule_interval='@once',
)
 
# Source:
# s_schema = 'humanresources'
# s_table = 'department'
# py_app = f'EL_OLTP_{s_schema[:2]}_{s_table}.py'

ssh_command = f'''
docker exec spark-master bash -c 'spark-submit \
    --master spark://spark-master:7077 \
    --executor-cores 1 \
    --executor-memory 1g \
    --driver-cores 1 \
    --driver-memory 1g \
    /opt/spark-apps/create_schema.py'
'''

ssh_spark_submit_task = SSHOperator(
    task_id='delta-create-schema',
    ssh_conn_id='ssh_spark_adw14',
    command=ssh_command,
    cmd_timeout=3600,
    dag=dag,
)
