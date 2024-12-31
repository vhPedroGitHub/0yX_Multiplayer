import psycopg2
from psycopg2.extras import RealDictCursor

def get_db_connection():
    conn = psycopg2.connect(
        host="localhost",
        database="partidas",
        user="postgres",
        password="12345678"
    )
    return conn