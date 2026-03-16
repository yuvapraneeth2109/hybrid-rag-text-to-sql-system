from backend.vector_store import SchemaVectorStore
from backend.schema_loader import load_all_schemas

class TableRetriever:
    """
    Responsible for selecting the most relevant tables
    for a given natural language banking question.
    """

    # 🔑 Banking keyword → table priority mapping
    TABLE_PRIORITY = {
        "balance": ["DM_ACCOUNT_F"],
        "working balance": ["DM_ACCOUNT_F"],
        "available balance": ["DM_ACCOUNT_F"],
        "account": ["DM_ACCOUNT"],
        "customer": ["DM_CUSTOMER"],
        "loan": ["DM_AA_CONTRACT_D"],
        "emi": ["DM_AA_ACCOUNT_DETAILS_DETAILS"],
        "repayment": ["DM_AA_ACCOUNT_DETAILS_DETAILS"],
        "arrangement": ["DM_AA_ARR_ACCOUNT_DETAILS"],
        "activity": ["DM_AA_ARRANGEMENT_ACTIVITY"],
        "atm": ["DM_ATM_TRANSACTION"],
        "withdrawal": ["DM_ATM_TRANSACTION"],
        "statement": ["DM_STMT_ENTRY"],
        "transaction": ["DM_STMT_ENTRY"],
        "payment": ["DM_TPH_POR"],
        "branch": ["DM_COMPANY"],
        "company": ["DM_COMPANY"],
        "currency": ["DM_CURRENCY"],
        "exchange rate": ["DM_CURRENCY"],
        "posting restrict": ["DM_POSTING_RESTRICT"],
        "user": ["DM_USER"]
    }

    def __init__(self):
        # Load schemas once
        self.schemas = load_all_schemas()

        # Build vector store once
        self.store = SchemaVectorStore()
        self.store.build(self.schemas)

    def retrieve(self, question: str, top_k: int = 6):
        """
        Returns a list of relevant table names
        based on semantic similarity + keyword priority.
        """

        if not question or not question.strip():
            return []

        question_lower = question.lower()

        # 1️⃣ Semantic search (vector similarity)
        vector_results = self.store.search(question, top_k=10)
        tables = [table for table, _ in vector_results]

        # 2️⃣ Keyword-based priority injection
        for keyword, priority_tables in self.TABLE_PRIORITY.items():
            if keyword in question_lower:
                for table in priority_tables:
                    if table not in tables:
                        tables.insert(0, table)

        # 3️⃣ Deduplicate while preserving order
        final_tables = []
        for t in tables:
            if t not in final_tables:
                final_tables.append(t)

        # 4️⃣ Return top N tables only
        return final_tables[:top_k]
