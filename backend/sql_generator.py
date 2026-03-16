from groq import Groq
import os
from dotenv import load_dotenv

load_dotenv()

# Initialize client with your Groq API key
client = Groq(api_key=os.getenv("GROQ_API_KEY"))

def generate_sql(prompt: str) -> str:
    """
    Calls the Groq LLM with a strict SQL prompt 
    and returns the generated SQL text.
    """
    try:
        response = client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[{"role": "user", "content": prompt}],
            temperature=0,
            max_tokens=500
        )
        sql = response.choices[0].message.content
        # Remove any accidental ```sql fences
        sql = sql.replace("```sql", "").replace("```", "").strip()
        return sql

    except Exception as e:
        # If something fails, return the error text
        return f"SQL_GENERATION_ERROR: {str(e)}"
