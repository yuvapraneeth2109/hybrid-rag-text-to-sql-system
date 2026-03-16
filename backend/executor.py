from typing import Tuple,Union

import pandas as pd
from sqlalchemy import text
from backend.db import get_engine
from backend.sql_validator import validate_sql

def execute_sql(
        sql: str,
        max_rows: int = 1000
) -> Tuple[bool, Union[pd.DataFrame,str]]:
    """
    Execute a validated SELECT SQL query safely and return a DataFrame.

    Args:
        sql: SELECT query only
        max_rows: Hard result size limit

    Returns:
        (success, DataFrame | error_message)
    """

    # 1️⃣ Validate SQL again (defense in depth)
    is_valid, message = validate_sql(sql)
    if not is_valid:
        return False, message

    engine = get_engine()

    try:
        with engine.connect() as conn:
            result = conn.execute(text(sql))

            # Convert result to DataFrame
            df = pd.DataFrame(result.fetchall(), columns=result.keys())

            # Limit rows
            if len(df) > max_rows:
                df = df.head(max_rows)

            return True, df

    except Exception as e:
        return False, str(e)
