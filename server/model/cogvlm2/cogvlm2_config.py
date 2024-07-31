from dataclasses import dataclass

@dataclass(frozen=True)
class CogVLM2Config:
    TEMPLATE_STRING: str = "A chat between a curious user and an artificial intelligence assistant. The assistant gives helpful, detailed, and polite answers to the user's questions. USER: {} ASSISTANT:"
    USER_IDENTIFIER: str = "USER"
    ASSISTANT_IDENTIFIER: str = "ASSISTANT"
