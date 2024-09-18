import os
from delta import *
from pyspark.sql import SparkSession

def main():

    schema = 'address'
    table = 'businessentity'
    delta_path = f'Files/{schema}/{table}'
    bucket_name = 'delta'
    destination_path = f's3a://{bucket_name}/db/bronze/postgres/{schema}/{table}'

    # Postgres
    # pg_host = os.environ.get('PG_HOST')
    # pg_port = os.environ.get('PG_PORT')
    # pg_db = os.environ.get('PG_DB')
    # pg_user = os.environ.get('PG_USER')
    # pg_pwd = os.environ.get('PG_PWD')
    pg_host = 'ep-shiny-glitter-a1o3fxf4.ap-southeast-1.aws.neon.tech'
    pg_port = '5432'
    pg_db = 'adw14'
    pg_user = 'adw_user'
    pg_pwd = 'adw_password123'

    # S3
    aws_access_key = os.environ.get('AWS_ACCESS_KEY')
    aws_secret_key = os.environ.get('AWS_SECRET_KEY')
    aws_s3_endpoint = os.environ.get('AWS_S3_ENDPOINT')

    spark = SparkSession.builder \
        .appName("Extract Load Postgres to S3") \
        .enableHiveSupport() \
        .getOrCreate()
    
    jdbc_url = f"jdbc:postgresql://{pg_host}:{pg_port}/{pg_db}"
    properties = {
        "user": f"{pg_user}",
        "password": f"{pg_pwd}",
        "driver": "org.postgresql.Driver"
    }
    table_name = f"{schema}.{table}"
    df = spark.read.jdbc(url=jdbc_url, table=table_name, properties=properties)
    print(destination_path)
    print(jdbc_url)
    # df.write.format("delta").mode("overwrite").save(destination_path)
    df.show()

    df.write.format("delta").option("delta.columnMapping.mode", "name")\
        .option("path", destination_path)\
        .saveAsTable("deltadb.businessentity")

    # dt = DeltaTable.forName(spark, "wba.test_table")

    # dt.toDF().show()


if __name__ == "__main__":
    main()