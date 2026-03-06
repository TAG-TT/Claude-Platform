import anthropic
import os

client = anthropic.Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY")
)

def analyze_repo(text):

    message = client.messages.create(
        model="CLAUDE_MODEL=claude-3-5-sonnet-latest",
        max_tokens=1000,
        messages=[{
            "role": "user",
            "content": text
        }]
    )

    return message.content