import re
from typing import List, Optional

from model.gptneo.gptneo_config import GptNeoConfig
from model.gptneo.gptneo_history import GptNeoHistory


def extract_assistant_reply(
        response: dict, history: Optional[List[GptNeoHistory]] = None
) -> str:
    text = response[0]["generated_text"]

    # Remove the prefix string
    text = re.sub(GptNeoConfig.PREFIX_STRING, "", text)

    # Remove the history
    if history is not None:
        for entry in history:
            text = text.replace(str(entry), "")

    # Find the start of the next assistant reply
    assistant_start = text.find(GptNeoConfig.ASSISTANT_IDENTIFIER)
    if assistant_start == -1:
        return ""  # No assistant identifier found

    # Extract text starting after the assistant identifier and colon
    text = text[assistant_start + len(GptNeoConfig.ASSISTANT_IDENTIFIER) + 1:].strip()

    # Find the start of the next user reply, or the next newline
    user_start = text.find(GptNeoConfig.USER_IDENTIFIER)
    newline_start = text.find("\n")
    if user_start != -1 and user_start < newline_start:
        text = text[:user_start].strip()
    elif newline_start != -1:
        text = text[:newline_start].strip()

    # Split the remaining text into sentences
    sentences = re.split(r"(?<=[.!?])", text)
    response_text = sentences[0].strip()  # definitely include the first sentence
    for sentence in sentences[1:]:
        # if sentence has colon, stop
        if ":" in sentence:
            break
        response_text += sentence

    return response_text.strip()


def remove_unexpected_punctuation(string: str) -> str:
    allowed_punctuation = r"[\.,!?]"
    cleaned_string = re.sub(r"[^\w\s" + allowed_punctuation + "]", "", string)
    return cleaned_string
