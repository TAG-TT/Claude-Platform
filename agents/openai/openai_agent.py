# 🟥 PRODUCTION CODE

from openai import OpenAI
import os

MODEL = os.getenv("OPENAI_MODEL", "gpt-4o")

client = OpenAI(
    api_key=os.getenv("OPENAI_API_KEY")
)


def run_prompt(prompt):

    response = client.responses.create(
        model=MODEL,
        input=prompt
    )

    return response.output_text