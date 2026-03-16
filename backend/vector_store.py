import numpy as np
from backend.embeddings import embed_text

class SchemaVectorStore:
    def __init__(self):
        self.vectors = []
        self.table_names = []
        self.built = False

    def build(self, schemas: dict):
        """
        Build vector store from schema text.
        Args:
            schemas: Dict where key = table name, value = schema text
        """
        self.vectors = []
        self.table_names = []

        for table, schema_text in schemas.items():
            # embed the schema text
            vector = embed_text(schema_text)
            self.vectors.append(vector)
            self.table_names.append(table)

        # convert to numpy array
        if self.vectors:
            self.vectors = np.array(self.vectors)

        self.built = True

    def search(self, query: str, top_k: int = 5):
        """
        Search for similar schema texts to the query.
        Returns:
            List of (table_name, similarity_score)
        """
        if not self.built:
            raise RuntimeError("Vector store not built")

        # embed the query
        query_vec = embed_text(query)

        # compute similarity scores — dot product of normalized vectors
        # dot product works as a cosine similarity here
        scores = np.dot(self.vectors, query_vec)

        # sort by highest score
        top_indices = scores.argsort()[-top_k:][::-1]

        results = [(self.table_names[i], float(scores[i])) for i in top_indices]
        return results
