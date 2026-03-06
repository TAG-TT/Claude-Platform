import pkgutil
import langchain
from langchain import chat_models

print('chat_models submodules:', [m.name for m in pkgutil.iter_modules(chat_models.__path__)])
print('langchain submodules containing chat:', [m.name for m in pkgutil.iter_modules(langchain.__path__) if 'chat' in m.name])
print('langchain.chat_models.__file__', chat_models.__file__)
