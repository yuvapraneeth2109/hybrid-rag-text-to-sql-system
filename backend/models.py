from sqlalchemy import Table, Column, Integer, String, MetaData

# This metadata object is REQUIRED by SQLAlchemy
metadata = MetaData()

# Table to store chatbot conversations
messages = Table(
    "messages",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("user_message", String, nullable=False),
    Column("bot_response", String, nullable=False)
)
