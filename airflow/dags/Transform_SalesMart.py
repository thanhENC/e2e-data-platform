'''
Transform SalesMart DAG
'''

from airflow import DAG
from airflow.providers.ssh.operators.ssh import SSHOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.task_group import TaskGroup
from datetime import datetime, timedelta

# ==========================================================
# DAG configuration
# ==========================================================
default_args = {
    'owner': 'thanhenc',
    'depends_on_past': False,
    'start_date': datetime(2024, 1, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=5)
}

# ==========================================================
# Define the DAG
with DAG(
    f'dbt-salesmart',
    default_args=default_args,
    schedule_interval='0 19 * * *',
    catchup=False,
    tags=['egn:trino-dbt', 'src:trino', 'sche:sales']
) as dag:

    # Create a Task Group
    with TaskGroup('data_transformation_tasks', tooltip='DBT Trino - Sales Mart') as data_transformation_group:
        # Dim Products
        cmd_dim_products = '''
        docker exec dbt bash -c 'dbt run --select dim_products'
        '''
        t1 = SSHOperator(
            task_id=f'dbt_dim_products',
            ssh_conn_id='ssh_dbt',
            command=cmd_dim_products,
            cmd_timeout=3600,
        )
        
        # Dim Customers
        cmd_dim_customers = '''
        docker exec dbt bash -c 'dbt run --select dim_customers'
        '''
        t2 = SSHOperator(
            task_id=f'dbt_dim_customers',
            ssh_conn_id='ssh_dbt',
            command=cmd_dim_customers,
            cmd_timeout=3600,
        )
        
        # Fact Sales
        cmd_fact_sales = '''
        docker exec dbt bash -c 'dbt run --select fact_sales'
        '''
        t3 = SSHOperator(
            task_id=f'dbt_fact_sales',
            ssh_conn_id='ssh_dbt',
            command=cmd_fact_sales,
            cmd_timeout=3600,
        )

        # Set dependencies for the tasks
        t1 >> t3
        t2 >> t3

    start_task = DummyOperator(
        task_id='start_task',
    )
    
    finish_task = DummyOperator(
        task_id='finish_task',
    )

    # Set dependencies for the start task, the Task Group and the finish task
    start_task >> data_transformation_group >> finish_task