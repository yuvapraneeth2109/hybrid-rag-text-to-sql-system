import os
from groq import Groq
from dotenv import load_dotenv

load_dotenv()

client = Groq(api_key=os.getenv("GROQ_API_KEY"))

SYSTEM_INSTRUCTIONS = """
You are a professional banking assistant.
Answer clearly and concisely.
You can explain banking terms, products, accounts, credit, loans, interest, etc.
If the question is not banking-related, politely respond that you specialize in banking topics.
Always consider prior conversation context when responding.
"""

def generate_response(conversation_history: list) -> str:
    """
    conversation_history: list of dict with roles and content
    Example:
    [
        {"role": "system", "content": SYSTEM_INSTRUCTIONS},
        {"role": "user", "content": "First question"},
        {"role": "assistant", "content": "Answer"},
        {"role": "user", "content": "Second question"},
    ]
    """
    response = client.chat.completions.create(
        model="llama-3.1-8b-instant",
        messages=conversation_history,
        max_tokens=300,
        temperature=0.3
    )

    return response.choices[0].message.content.strip()
