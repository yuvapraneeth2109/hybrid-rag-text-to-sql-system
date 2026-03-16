from groq import Groq
import os
from dotenv import load_dotenv
import pandas as pd

load_dotenv()

client = Groq(api_key=os.getenv("GROQ_API_KEY"))

def generate_natural_answer(question: str, sql: str, dataframe: pd.DataFrame) -> str:
    """
    Generate a human-readable answer from SQL result data.
    Strict rules for safety:
    - Use only the SQL result
    - No invented facts
    - Keep language simple and professional
    """

    if dataframe is None or dataframe.empty:
        return "No records were found for this query."

    # Convert DataFrame to a short text table
    # Show up to first 5 rows
    preview = dataframe.head(5).to_dict(orient="records")

    prompt = f"""
You are a banking operations assistant.

STRICT RULES:
- Use ONLY the SQL results provided below.
- Do NOT invent any values.
- Do NOT estimate or assume anything.
- If no data, say so clearly.
- Keep language simple and professional.

USER QUESTION:
{question}

GENERATED SQL:
{sql}

QUERY RESULT DATA (first rows):
{preview}

TASK:
Explain the result in clear, simple English for a banking operations user.
"""

    response = client.chat.completions.create(
        model="llama-3.1-8b-instant",
        messages=[{"role": "user", "content": prompt}],
        max_tokens=300,
        temperature=0.0,
    )

    return response.choices[0].message.content.strip()
