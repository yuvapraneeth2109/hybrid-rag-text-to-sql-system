import os
from typing import Dict

SCHEMA_DIR = os.path.join(
    os.path.dirname(os.path.dirname(__file__)),
    "schemas"
)

def load_all_schemas() -> Dict[str, str]:
    """
    Loads all .schema.txt files from /schemas directory.

    Returns:
        {
          "DM_CUSTOMER": "full schema text ...",
          "DM_ACCOUNT": "full schema text ...",
          ...
        }
    """
    schemas: Dict[str, str] = {}

    if not os.path.exists(SCHEMA_DIR):
        raise FileNotFoundError(f"Schema directory not found: {SCHEMA_DIR}")

    for file_name in os.listdir(SCHEMA_DIR):
        if not file_name.lower().endswith(".schema.txt"):
            continue

        table_name = file_name.replace(".schema.txt", "").upper()
        file_path = os.path.join(SCHEMA_DIR, file_name)

        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read().strip()

            if not content:
                raise ValueError(f"Schema file is empty: {file_name}")

            schemas[table_name] = content

    if not schemas:
        raise RuntimeError("No schema files loaded. Check /schemas directory.")

    return schemas


def load_single_schema(table_name: str) -> str:
    """
    Load schema for a single table.

    Args:
        table_name: e.g. DM_CUSTOMER

    Returns:
        Schema text
    """
    table_name = table_name.upper()
    file_name = f"{table_name}.schema.txt"
    file_path = os.path.join(SCHEMA_DIR, file_name)

    if not os.path.exists(file_path):
        raise FileNotFoundError(f"Schema not found for table: {table_name}")

    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read().strip()

        if not content:
            raise ValueError(f"Schema file is empty: {file_name}")

        return content
