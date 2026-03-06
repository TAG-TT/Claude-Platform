from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage

# ensure the langchain-openai integration is installed (pip install langchain-openai)
llm = ChatOpenAI(model="gpt-4", temperature=0.2)
resp = llm.invoke([HumanMessage(content="Hello")])

response = llm.invoke("Analyze this codebase")
print(response)