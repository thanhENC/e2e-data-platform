from pyspark.sql import SparkSession, Row
from pyspark.sql import functions as F

if __name__ == '__main__':
    # Create a SparkSession
    spark = SparkSession\
        .builder.appName("MongoDBIntegration")\
        .getOrCreate()
        
    # Read data from Mongo
    readUsers = spark.read\
        .format("com.mongodb.spark.sql.DefaultSource")\
        .option("uri", "mongodb://127.0.0.1/moviesdata.users")\
        .load()
        
    readUsers.createOrReplaceTempView("users")
    
    readUsers.printSchema()
    
    sqlDF = spark.sql("SELECT * FROM users WHERE age < 20")