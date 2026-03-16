from sqlalchemy import text
from backend.db import get_engine

engine = get_engine()

with engine.connect() as conn:
    # Create a table
    conn.execute(text("""
    CREATE TABLE IF NOT EXISTS test_table (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50)
    )
    """))
    print("Table created!")

    # Insert a sample row
    conn.execute(text("""
    INSERT INTO test_table (name) VALUES ('Harsha')
    """))

    # Query the table
    result = conn.execute(text("SELECT * FROM test_table"))
    for row in result:
        print(row)
