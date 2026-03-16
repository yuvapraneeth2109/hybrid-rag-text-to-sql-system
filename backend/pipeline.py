from backend.retriever import TableRetriever
from backend.prompt_builder import build_sql_prompt
from backend.sql_generator import generate_sql
from backend.sql_validator import validate_sql
from backend.executor import execute_sql
from backend.schema_loader import load_all_schemas

class BankingNLQPipeline:
    def __init__(self):
        # Load all schemas once
        self.schemas = load_all_schemas()
        self.retriever = TableRetriever()

    def answer(self, question: str):
        # 1️⃣ Retrieve relevant tables
        tables = self.retriever.retrieve(question)

        # 2️⃣ Build SQL prompt
        prompt = build_sql_prompt(question, tables, self.schemas)

        # 3️⃣ Generate SQL using LLM
        sql = generate_sql(prompt)

        # 4️⃣ Validate SQL
        valid, message = validate_sql(sql)
        if not valid:
            return {
                "tables": tables,
                "sql": sql,
                "data": None,
                "error": message
            }

        # 5️⃣ Execute SQL
        success, result = execute_sql(sql)
        if not success:
            return {
                "tables": tables,
                "sql": sql,
                "data": None,
                "error": result
            }

        # 6️⃣ Return success with result DataFrame
        return {
            "tables": tables,
            "sql": sql,
            "data": result,
            "error": None
        }
