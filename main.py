# main.py
from agents.chatbot import ChatBotAgent

def main():
    bot = ChatBotAgent("HarshaBot")
    print(bot.greet())

    while True:
        user_input = input("You: ")
        if user_input.lower() in ["exit", "quit"]:
            print("Exiting chatbot. Bye!")
            break
        response = bot.respond(user_input)
        print(f"{bot.name}: {response}")

if __name__ == "__main__":
    main()
