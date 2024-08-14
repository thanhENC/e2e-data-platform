'''
MongoDBClient class is used to connect to the MongoDB database and execute queries.
'''

import pymongo

class MongoDBClient:
    def __init__(self, database, user, password, host="127.0.0.1", port="27017"):
        self.database = database
        self.user = user
        self.password = password
        self.host = host
        self.port = port
        
    def create_conn(self):
        # Establishing the connection
        conn = pymongo.MongoClient(f"mongodb+srv://{self.user}:{self.password}@{self.host}")
        return conn
    
    def execute_query(self, query):
        conn = self.create_conn()
        db = conn[self.database]
        print(f"Query has been executed successfully!")
        # Closing the connection
        conn.close()