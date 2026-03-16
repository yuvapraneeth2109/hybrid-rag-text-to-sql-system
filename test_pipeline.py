from backend.pipeline import BankingNLQPipeline

# Initialize pipeline
pipeline = BankingNLQPipeline()

# Sample banking question (change as needed)
question = "Show me the top 10 customers by balance"

print("🔹 USER QUESTION:", question)

# Run through pipeline
result = pipeline.answer(question)

# Display output
print("\n📜 Generated SQL:")
print(result.get("sql"))

print("\n📊 Result Data:")
if result.get("data") is not None:
    print(result["data"])
else:
    print("No data returned.")

print("\n❗ Error (if any):")
print(result.get("error"))
