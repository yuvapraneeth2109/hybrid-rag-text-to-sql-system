import streamlit as st
from datetime import datetime
from agents.chatbot import ChatBotAgent
from backend.pipeline import BankingNLQPipeline
from backend.query_normalizer import normalize_query
# Optional natural answer generator — enable if needed
# from backend.answer_generator import generate_natural_answer

# Page setup
st.set_page_config(page_title="🏦 Banking LLM & SQL Agent", page_icon="🏦")

# Sidebar mode selector
mode = st.sidebar.selectbox("Choose Mode", ["Chatbot", "SQL Query"])

st.title("🏦 Banking LLM & SQL Query Agent")

# ==========================
# CHATBOT MODE
# ==========================
if mode == "Chatbot":

    # Initialize chatbot in session state
    if "bot" not in st.session_state:
        st.session_state.bot = ChatBotAgent("BankBot")

    if "messages" not in st.session_state:
        st.session_state.messages = []

    # Clear chat button
    if st.button("🗑️ Clear Chat"):
        st.session_state.messages = []
        st.rerun()

    # Display chat history
    for msg in st.session_state.messages:
        role = msg["role"]
        content = msg["content"]
        timestamp = msg.get("time", "")
        avatar = "🤖" if role == "assistant" else "🙂"
        
        with st.chat_message(role, avatar=avatar):
            st.markdown(f"**{timestamp}**  \n{content}")

    # Chat input
    user_input = st.chat_input("Ask your banking question...")

    if user_input:
        now = datetime.now().strftime("%H:%M:%S")
        st.session_state.messages.append(
            {"role": "user", "content": user_input, "time": now}
        )
        with st.chat_message("user", avatar="🙂"):
            st.markdown(f"**{now}**  \n{user_input}")

        # Get LLM response (with context)
        response = st.session_state.bot.respond(
            user_input,
            history=st.session_state.messages
        )

        now_resp = datetime.now().strftime("%H:%M:%S")
        st.session_state.messages.append(
            {"role": "assistant", "content": response, "time": now_resp}
        )
        with st.chat_message("assistant", avatar="🤖"):
            st.markdown(f"**{now_resp}**  \n{response}")

# ==========================
# SQL QUERY MODE
# ==========================
else:
    st.markdown("""
        ### ⚡ SQL Query Mode
        Enter a natural language question about your banking data,
        and I will show the generated SQL and the results.
    """)

    # Initialize SQL pipeline
    if "sql_pipeline" not in st.session_state:
        st.session_state.sql_pipeline = BankingNLQPipeline()

    # Input for NLQ question
    nlq_query = st.text_input("Ask a SQL question...")

    # Run query button
    if st.button("Run SQL Query"):
        if not nlq_query:
            st.warning("Please enter a question to run.")
        else:
            # Normalize the question text
            normalized_question = normalize_query(nlq_query)

            # Show original & normalized
            st.write("**Original question:**", nlq_query)
            st.write("**Normalized question:**", normalized_question)

            # Generate SQL + results
            with st.spinner("Generating SQL..."):
                result = st.session_state.sql_pipeline.answer(normalized_question)

            sql = result.get("sql")
            data = result.get("data")
            err = result.get("error")
            tables = result.get("tables")

            # Display generated SQL
            st.write("**Generated SQL:**")
            st.code(sql, language="sql")

            if err:
                st.error(f"❌ Error: {err}")
            else:
                # Show result table
                st.write("**Result Data:**")
                st.dataframe(data)

                # Optional: Show a plain‑English summary
                # summary = generate_natural_answer(nlq_query, sql, data)
                # st.markdown(f"**Summary Answer:**  \n{summary}")

                st.caption(f"Tables considered: {tables}")
