#!/bin/bash

# Simple Chatbot Structure
echo "AskkiBot: Hello! I'm AskkiBot. How can I help you today?"
echo "AskkiBot: Type 'exit' or 'quit' to end the conversation."

# Main chatbot loop
while true; do
    echo -n "You: "
    read user_input
    
    # Convert input to lowercase for case-insensitive matching
    input_lower=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')
    
    # Switch case to handle different inputs
    case "$input_lower" in
        "hello"|"hi"|"hey")
            echo "AskkiBot: Hello! Nice to meet you!"
            ;;
        "how are you"|"how are you?")
            echo "AskkiBot: I'm doing great, thank you for asking!"
            ;;
        "what is your name"|"what's your name"|"who are you")
            echo "AskkiBot: I'm AskkiBot, your friendly bash chatbot!"
            ;;
        "help")
            echo "AskkiBot: I can chat with you! Try saying hello, asking how I am, or asking my name."
            ;;
        "exit"|"quit"|"bye")
            echo "AskkiBot: Goodbye! It was nice chatting with you!"
            break
            ;;
        *)
            echo "AskkiBot: I'm not sure how to respond to that. Type 'help' for assistance."
            ;;
    esac
done
