# Hybrid RAG + Text-to-SQL System

This project implements a local-first AI system that answers natural language questions using both structured banking data and unstructured documents.  

The system combines Retrieval-Augmented Generation (RAG) with a Text-to-SQL pipeline so that queries can be answered using database records as well as internal documentation.

The entire system runs locally to ensure that sensitive financial data never leaves the internal environment.

##Sample output:

https://youtu.be/p9Claq39a0s?si=e4s1JJJEzPCKJAYm

---

## Problem Statement

Traditional database systems require users to write SQL queries to retrieve information.  
However, most business users prefer asking questions in natural language.

At the same time, many answers exist partly in structured databases and partly in internal documents such as policy files, FAQs, and operational guidelines.

This project solves that problem by building a hybrid system that can:

- translate natural language questions into SQL queries
- retrieve relevant documents using semantic search
- combine both sources to generate a final answer

---

## System Overview

The pipeline processes a user query in several stages:

1. **Query Understanding**
   The system analyzes the user question and determines whether structured data is required.

2. **Text-to-SQL Generation**
   If the question requires database information, the system generates a SQL query using the database schema.

3. **Vector Retrieval**
   Relevant document chunks are retrieved from a FAISS vector index.

4. **Context Assembly**
   Results from the SQL query and retrieved documents are combined.

5. **LLM Response Generation**
   A locally running language model produces the final answer using only the retrieved context.

---

## Architecture

User Query  
↓  
Streamlit Interface  
↓  
LangChain Pipeline  
↓  
Text-to-SQL Engine → PostgreSQL  
Vector Retrieval → FAISS  
↓  
Context Aggregation  
↓  
Local LLM  
↓  
Final Response

---

## Technology Stack

**Database**
- PostgreSQL

**Vector Store**
- FAISS (Facebook AI Similarity Search)

**LLM Framework**
- LangChain

**Local Model Runtime**
- Ollama / local inference

**Embedding Model**
- all-MiniLM-L6-v2

**Interface**
- Streamlit

---

## Document Processing Pipeline

Before documents can be searched semantically, they are processed through several steps.

### 1. Chunking

Large documents are divided into smaller segments.

Typical configuration:
- chunk size: 500–1000 tokens
- overlap: 50–100 tokens

The overlap ensures that important context is not lost at chunk boundaries.

---

### 2. Embedding Generation

Each chunk is converted into a numerical vector using a sentence embedding model.

These vectors represent the semantic meaning of the text.

---

### 3. FAISS Indexing

The embeddings are stored in a FAISS index which allows fast similarity search.

When a query is received, the system finds the most relevant chunks using cosine similarity.

---

## Text-to-SQL Generation

For structured data questions, the system generates SQL queries using the database schema.

The model is provided with:

- table names
- column descriptions
- relationships between tables
- example queries

This allows the system to construct valid SQL queries for PostgreSQL.

The query is executed and the results are returned to the pipeline.

---

## Hybrid Context Generation

The system merges two sources of information:

1. Results from the PostgreSQL query
2. Retrieved document chunks from FAISS

These are combined into a structured prompt that is sent to the language model.

The model is instructed to generate answers using **only the provided context**.

---

## Security and Privacy

A major design goal of this project is **data sovereignty**.

Key measures include:

- local embedding generation
- local vector database
- locally hosted LLM
- no external API calls

This ensures that sensitive banking data is never transmitted to third-party services.

---

## Running the Application

Install dependencies: 
pip install -r requirements.txt


Run the Streamlit interface: 
streamlit run app.py


