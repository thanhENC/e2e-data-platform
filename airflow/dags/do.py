'''
This DAG uses the pydo library to interact with the DigitalOcean API. It retrieves a list of droplets and prints them to the console.
'''

from pydo import Client
from airflow.models import Variable
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

def f_get_droplets():
    client = Client(Variable.get('DO_TOKEN'))
    droplets = client.droplets.list()
    print('Getting droplets from DigitalOcean')
    return droplets

def f_print_droplets():
    droplets = f_get_droplets()
    print(droplets)
        
dag = DAG('do', description='DigitalOcean Droplets',
            schedule_interval='0 12 * * *',
            start_date=datetime(2024, 3, 20), catchup=False)

o_get_droplets = PythonOperator(
    task_id='get_droplets',
    python_callable=f_get_droplets,
    dag=dag
)

o_print_droplets = PythonOperator(
    task_id='print_droplets',
    python_callable=f_print_droplets,
    dag=dag
)

o_get_droplets >> o_print_droplets