import re

# List of forbidden SQL keywords 
FORBIDDEN = ["INSERT", "UPDATE", "DELETE", "DROP", "CREATE", "ALTER", "TRUNCATE", "UNION"]

def validate_sql(sql: str):
    """
    Strictly validate SQL to ensure it is safe for execution.
    Only allow a single SELECT statement.

    Returns:
        (True, "SQL is safe") if valid
        (False, "<error message>") if invalid
    """
    if not sql or not isinstance(sql, str):
        return False, "Empty or invalid SQL"

    sql_upper = sql.strip().upper()

    # 1️⃣ Must start with SELECT
    if not sql_upper.startswith("SELECT"):
        return False, "Only SELECT statements are allowed"

    # 2️⃣ Disallow multiple statements (e.g., two SELECTs separated by semicolon)
    #    Everything after the first semicolon (if any) is not allowed
    if ";" in sql_upper.strip()[:-1]:
        return False, "Multiple SQL statements are not allowed"

    # 3️⃣ Check forbidden keywords
    for word in FORBIDDEN:
        # Only match standalone words (word boundaries)
        if re.search(rf"\b{word}\b", sql_upper):
            return False, f"Forbidden keyword detected: {word}"

    return True, "SQL is safe"
