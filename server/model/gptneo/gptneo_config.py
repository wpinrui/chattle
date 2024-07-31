from dataclasses import dataclass

@dataclass(frozen=True)
class GptNeoConfig:
    USER_IDENTIFIER: str = "USER"
    ASSISTANT_IDENTIFIER: str = "JANET"
    PREFIX_STRING: str = "This is a conversation between the user and Janet. The conversation is very friendly. Janet loves to talk about sports and Korean music. Here is the conversation:"

