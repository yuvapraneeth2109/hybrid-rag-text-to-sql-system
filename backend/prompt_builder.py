def build_sql_prompt(
    question: str,
    selected_tables: list,
    schemas: dict,
    previous_error: str = None
) -> str:
    """
    Banking-safe SQL prompt builder.
    Works with TEXT schemas (no dict indexing).
    """

    schema_block = ""

    for table in selected_tables:
        schema_text = schemas.get(table)

        if not schema_text:
            continue

        schema_block += f"""
==============================
TABLE: {table}
==============================
{schema_text}
"""

    error_block = ""
    if previous_error:
        error_block = f"""
==============================
PREVIOUS SQL ERROR (DO NOT REPEAT)
==============================
{previous_error}
"""

    return f"""
You are a **Senior Core Banking SQL Architect**.

Your task:
- Convert the user question into **ONE PostgreSQL SELECT query**
- Use ONLY the tables and columns provided below
- NEVER invent columns or tables
- NEVER guess data types
- If a column is NUMERIC → do NOT compare with strings
- If unsure → output exactly: NOT_POSSIBLE

==============================
STRICT SQL RULES
==============================
- ONLY ONE SELECT statement
- NO INSERT, UPDATE, DELETE, DROP
- NO UNION
- NO multiple SELECTs
- NO SELECT *
- Use explicit column names
- Use table aliases
- LIMIT 50 rows
IMPORTANT DATA TYPE RULES:
- If a column is NUMERIC, do NOT compare it to string values.
- Status-like numeric columns (STATUS, RECORD_STATUS, ARR_STATUS, POSTING_RESTRICT, etc.)
  must be compared using numeric codes only.
- NEVER use 'active', 'inactive', 'closed', 'overdue' as string literals
  unless the column is VARCHAR.
- If business meaning is unclear, return the column without filtering.
IMPORTANT:
- Use the MINIMUM number of tables.
- Do NOT include tables unless at least one column from them is selected.
- Do NOT compare NUMERIC columns to text values.
- Use column data types exactly as defined in the schema.
- Remove any table that does not contribute at least one column or join condition to the final SQL.  

==============================
AVAILABLE SCHEMA
==============================
{schema_block}

{error_block}

==============================
USER QUESTION
==============================
{question}

==============================
OUTPUT FORMAT
==============================
-- SQL
<POSTGRESQL SELECT QUERY ONLY>
"""
