from backend.llm import generate_response
from backend.db import get_engine
from backend.models import messages

engine = get_engine()

# System instructions for the banking chatbot
SYSTEM_INSTRUCTIONS = """
You are a professional banking assistant.
Answer clearly and concisely.
You can explain banking terms, products, accounts, loans, interest, and related information.
If the question is not about banking, politely explain that you specialize in banking.
Always consider previous conversation context when responding.
"""

class ChatBotAgent:
    def __init__(self, name: str = "BankBot"):
        self.name = name

    def respond(self, user_input: str, history: list = None) -> str:
        """
        Generates a response from the banking LLM assistant,
        optionally using conversation history.
        """

        # Build the conversation list for the LLM
        conversation = [{"role": "system", "content": SYSTEM_INSTRUCTIONS}]

        # Add previous messages if provided
        if history:
            for msg in history:
                # Only include user/assistant roles
                # history is expected to be a list of dicts
                # with "role" and "content"
                conversation.append(
                    {"role": msg["role"], "content": msg["content"]}
                )

        # Add the latest user input
        conversation.append({"role": "user", "content": user_input})

        # Call LLM
        bot_reply = generate_response(conversation)

        # Store in database
        try:
            with engine.connect() as conn:
                conn.execute(
                    messages.insert().values(
                        user_message=user_input,
                        bot_response=bot_reply
                    )
                )
                conn.commit()
        except Exception as db_err:
            # You might log this or ignore if db not critical
            print("⚠️ DB Logging Error:", db_err)

        return bot_reply