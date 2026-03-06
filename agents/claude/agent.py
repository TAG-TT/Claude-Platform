import anthropic
import os

client = anthropic.Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY")
)

def analyze_repo(text):

    message = client.messages.create(
        model="claude-3-sonnet-20240229",
        max_tokens=1000,
        messages=[{
            "role": "user",
            "content": text
        }]
    )

    return message.content