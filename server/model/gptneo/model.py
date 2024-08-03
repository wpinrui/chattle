from transformers import pipeline
from typing import List, Optional

from server.model.gptneo.gptneo_config import GptNeoConfig
from server.model.gptneo.gptneo_history import GptNeoHistory
from server.model.gptneo.parser import extract_assistant_reply

generator = pipeline("text-generation", model="google/gemma-2-2b", device="cuda:0")


def generate_response(query: str, history: Optional[List[GptNeoHistory]] = None) -> str:
    if history is None:
        history = []
        query = f"{GptNeoConfig.PREFIX_STRING}\n{GptNeoConfig.USER_IDENTIFIER}: {query}\n{GptNeoConfig.ASSISTANT_IDENTIFIER}:"
    else:
        old_prompt = GptNeoConfig.PREFIX_STRING + "\n"
        for entry in history:
            old_prompt += str(entry) + "\n"
        query = (
            old_prompt
            + f"{GptNeoConfig.USER_IDENTIFIER}: {query}\n{GptNeoConfig.ASSISTANT_IDENTIFIER}:"
        )

    print(f"Generated prompt: {query}")

    response = generator(
        query, do_sample=True, max_new_tokens=100, repetition_penalty=1.2
    )

    print(f"Generated response: {response}")
    return extract_assistant_reply(response, history)
