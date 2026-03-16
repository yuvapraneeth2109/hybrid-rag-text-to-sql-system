def normalize_query(query: str) -> str:
    """
    Normalize user query:
    - lowercase
    - fix common banking spellings
    - expand shorthand terms

    Returns:
        Cleaned query string
    """
    if not isinstance(query, str):
        return ""

    q = query.lower().strip()

    # Common replacements / banking spellings
    replacements = {
        "balence": "balance",
        "bal": "balance",
        "acct": "account",
        "acc": "account",
        "cust": "customer",
        "amt": "amount",
        "txn": "transaction",
        "stmt": "statement",
        "avl": "available",
        "intrest": "interest",
    }

    for wrong, correct in replacements.items():
        q = q.replace(wrong, correct)

    return q
