# 🟥 PRODUCTION CODE
# Claude AI Agent

import os
import anthropic

MODEL = os.getenv("CLAUDE_MODEL", "claude-3-5-sonnet-latest")

client = anthropic.Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY")
)


def run_prompt(prompt):

    response = client.messages.create(
        model=MODEL,
        max_tokens=2000,
        messages=[{
            "role": "user",
            "content": prompt
        }]
    )

    return response.content