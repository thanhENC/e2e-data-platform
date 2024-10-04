'''
Extract Load OLTP Data from schema Purchasing
To Bronze Layer in S3 s3a://delta/bronze/postgres/purchasing
'''

from airflow import DAG
from airflow.providers.ssh.operators.ssh import SSHOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.task_group import TaskGroup
from datetime import datetime, timedelta

# ==========================================================
# Data Source Schema
# ==========================================================
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

# ==========================================================
# DAG configuration
# ==========================================================
default_args = {
    'owner': 'thanhenc',
    'depends_on_past': False,
    'start_date': datetime(2024, 1, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# ==========================================================
# Define the DAG
with DAG(
    f'spark-el-oltp-{source_schema["schema"]}',
    default_args=default_args,
    schedule_interval='0 18 * * *',
    catchup=False,
    tags=['egn:spark', 'src:oltp', 'sche:purchasing']
) as dag:

    # Create a Task Group
    with TaskGroup('data_loading_tasks', tooltip='Data Loading from Source Tables') as data_loading_group:
        
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
            )

            # Store task reference in the dictionary
            tasks[s_table] = task

            # Set task dependencies
            if i > 0:
                previous_table = source_schema['tables'][i - 1]
                tasks[s_table].set_upstream(tasks[previous_table])

    start_task = DummyOperator(
        task_id='start_task',
    )
    
    finish_task = DummyOperator(
        task_id='finish_task',
    )

    # Set dependencies for the start task, the Task Group and the finish task
    start_task >> data_loading_group >> finish_task