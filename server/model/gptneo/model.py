from transformers import pipeline
from typing import List, Optional

from history.history_item_interface import HistoryItemInterface
from model.gptneo.gptneo_config import GptNeoConfig
from model.gptneo.parser import extract_assistant_reply
from model.model_interface import Model


class GptNeo(Model):
    def __init__(self, model_name: str, device: str):
        self.generator = pipeline("text-generation", model=model_name, device=device)

    def generate_response(self, query: str, history: Optional[List[HistoryItemInterface]] = None) -> str:
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

        response = self.generator(
            query, do_sample=True, max_new_tokens=100, repetition_penalty=1.2
        )

        print(f"Generated response: {response}")
        return extract_assistant_reply(response, history)
