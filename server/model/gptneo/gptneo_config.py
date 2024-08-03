from dataclasses import dataclass

@dataclass(frozen=True)
class GptNeoConfig:
    USER_IDENTIFIER: str = "USER"
    ASSISTANT_IDENTIFIER: str = "JANET"
    PREFIX_STRING: str = "This is a conversation between the user and the AI-asssistant Janet. The user is asking questions and Janet is answering them. Janet tries to help in whatever way possible. Janet is very professional."

