'''
Extract Load data from OLTP Postgres to S3
Source: Postgres
Schema: humanresources
Table: department

Destination: S3
Layer: bronze
Table: hu_department
'''

import os
from delta import *
from pyspark.sql import SparkSession
from pyspark import SparkConf

def main():
    # Source
    s_dbtype = 'postgres'
    s_schema = 'humanresources'
    s_table = 'department'
    
    # Destination
    d_bucket = 'delta'
    d_layer = 'bronze'
    d_table = f"{s_schema[:2]}_{s_table}"
    d_path = f's3a://{d_bucket}/{d_layer}/{s_dbtype}/{s_schema}/{d_table}'

    # Postgres
    pg_host = os.environ.get('OLTP_DB_HOST')
    pg_port = os.environ.get('OLTP_DB_PORT')
    pg_db = os.environ.get('OLTP_DB_NAME')
    pg_user = os.environ.get('OLTP_DB_USER')
    pg_pwd = os.environ.get('OLTP_DB_PASSWORD')

    conf = SparkConf() \
        .set("spark.driver.cores", "1") \
        .set("spark.driver.memory", "512m") \
        .set("spark.executor.cores", "1") \
        .set("spark.executor.memory", "512m")

    spark = SparkSession.builder \
        .appName(f"EL OLTP to S3 - {s_schema} - {s_table}") \
        .config(conf=conf) \
        .enableHiveSupport() \
        .getOrCreate()
    
    jdbc_url = f"jdbc:postgresql://{pg_host}:{pg_port}/{pg_db}"
    properties = {
        "user": f"{pg_user}",
        "password": f"{pg_pwd}",
        "driver": "org.postgresql.Driver"
    }
    s_table_name = f"{s_schema}.{s_table}"
    df = spark.read.jdbc(url=jdbc_url, table=s_table_name, properties=properties)

    df.show()

    df.write.format("delta") \
        .mode("overwrite") \
        .option("delta.columnMapping.mode", "name") \
        .option("path", d_path) \
        .saveAsTable(f"{d_layer}.{d_table}")

    # dt = DeltaTable.forName(spark, "wba.test_table")
    # dt.toDF().show()

if __name__ == "__main__":
    main()