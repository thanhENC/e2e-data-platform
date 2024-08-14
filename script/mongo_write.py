from pyspark.sql import SparkSession, Row
from pyspark.sql import functions as F

def parseInput(line):
    fields = line.split('|')
    return Row(user_id = int(fields[0]), age = int(fields[1]), gender = fields[2], occupation = fields[3], zip = fields[4])

if __name__ == '__main__':
    # Create a SparkSession
    spark = SparkSession\
        .builder.appName("MongoDBIntegration")\
        .getOrCreate()
    
    # Build RDD on top of users data file
    lines = spark.sparkContext.textFile("hdfs:///user/maria_dev/ml-100k/u.user")
    
    # Creating new RDD by passing the parser function
    users = lines.map(parseInput)
    
    # Convert RDD into a DataFrame
    usersDataset = spark.createDataFrame(users)
    
    # Write the data into MongoDB
    usersDataset.write\
        .format("com.mongodb.spark.sql.DefaultSource")\
        .option("uri", "mongodb://127.0.0.1/moviesdata.users")\
        .mode("append")\
        .save()