from dataclasses import dataclass


@dataclass(frozen=True)
class DialoGptConfig:
    USER_IDENTIFIER: str = ">> User:"
    ASSISTANT_IDENTIFIER: str = ">> Janet:"
    PREFIX_STRING: str = ""
