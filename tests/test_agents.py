# 🟪 TESTING CODE

from agents.openai.openai_agent import run_prompt


def test_openai():

    response = run_prompt("hello")

    assert response is not None