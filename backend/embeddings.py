import numpy as np
from sentence_transformers import SentenceTransformer

# Load the embedding model once
_model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2")

EMBED_DIM = 384  # dimensionality of the embedding

def embed_text(text: str) -> np.ndarray:
    """
    Generate semantic embeddings for the given text.

    Args:
        text: Input text to embed

    Returns:
        A numpy array of floats representing the vector
    """
    if not text or not text.strip():
        # return a zero vector if empty
        return np.zeros(EMBED_DIM, dtype=np.float32)

    # generate the embedding and normalize
    vector = _model.encode(text, normalize_embeddings=True)
    return np.array(vector, dtype=np.float32)
