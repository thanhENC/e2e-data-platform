import os
import psycopg2
import pandas as pd
from psycopg2 import sql
from dotenv import load_dotenv

# Load environment variables from .env.postgres
load_dotenv()

# Database connection parameters
DB_NAME = os.getenv('POSTGRES_DB')
DB_USER = os.getenv('POSTGRES_USER')
DB_PASSWORD = os.getenv('POSTGRES_PASSWORD')
DB_HOST = os.getenv('POSTGRES_HOST')
DB_PORT = os.getenv('POSTGRES_PORT')

# List of tables and their corresponding CSV files
table_files = {
    "customers": "raw_customers.csv",
    "orders": "raw_orders.csv",
    "items": "raw_items.csv",
    "products": "raw_products.csv",
    "stores": "raw_stores.csv",
    "supplies": "raw_supplies.csv",
    "tweets": "raw_tweets.csv"
}

# SQL for creating tables
create_table_queries = {
    "customers": """
        CREATE TABLE IF NOT EXISTS customers (
            id UUID PRIMARY KEY,
            name VARCHAR(255)
        );
    """,
    "orders": """
        CREATE TABLE IF NOT EXISTS orders (
            id UUID PRIMARY KEY,
            customer UUID,
            ordered_at TIMESTAMP,
            store_id UUID,
            subtotal NUMERIC,
            tax_paid NUMERIC,
            order_total NUMERIC
        );
    """,
    "items": """
        CREATE TABLE IF NOT EXISTS items (
            id UUID PRIMARY KEY,
            order_id UUID,
            sku VARCHAR(50)
        );
    """,
    "products": """
        CREATE TABLE IF NOT EXISTS products (
            sku VARCHAR(50) PRIMARY KEY,
            name VARCHAR(255),
            type VARCHAR(50),
            price NUMERIC,
            description TEXT
        );
    """,
    "stores": """
        CREATE TABLE IF NOT EXISTS stores (
            id UUID PRIMARY KEY,
            name VARCHAR(255),
            opened_at TIMESTAMP,
            tax_rate NUMERIC
        );
    """,
    "supplies": """
        CREATE TABLE IF NOT EXISTS supplies (
            id VARCHAR(50) PRIMARY KEY,
            name VARCHAR(255),
            cost NUMERIC,
            perishable BOOLEAN,
            sku VARCHAR(50)
        );
    """,
    "tweets": """
        CREATE TABLE IF NOT EXISTS tweets (
            id UUID PRIMARY KEY,
            user_id UUID,
            tweeted_at TIMESTAMP,
            content TEXT
        );
    """
}

def create_tables(conn, cursor):
    for table, create_query in create_table_queries.items():
        cursor.execute(create_query)
        conn.commit()
        print(f"Table '{table}' checked/created.")

def load_data(conn, cursor, table, csv_file_path):
    df = pd.read_csv(csv_file_path)
    for index, row in df.iterrows():
        insert_query = sql.SQL("""
            INSERT INTO {table} ({columns})
            VALUES ({values})
            ON CONFLICT DO NOTHING;
        """).format(
            table=sql.Identifier(table),
            columns=sql.SQL(', ').join(map(sql.Identifier, df.columns)),
            values=sql.SQL(', ').join(sql.Placeholder() * len(df.columns))
        )
        cursor.execute(insert_query, tuple(row))
    conn.commit()
    print(f"Data loaded into '{table}' from '{csv_file_path}'.")

def main():
    # Connect to PostgreSQL database
    conn = psycopg2.connect(
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        host=DB_HOST,
        port=DB_PORT
    )
    cursor = conn.cursor()

    try:
        # Create tables if they don't exist
        create_tables(conn, cursor)

        # Load data into each table from corresponding CSV file
        for table, csv_file in table_files.items():
            csv_file_path = os.path.join('jaffle-data', csv_file)
            load_data(conn, cursor, table, csv_file_path)

    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()
