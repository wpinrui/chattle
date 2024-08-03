from collections import defaultdict
from typing import List, DefaultDict


class HistoryHandler:
    def __init__(self, max_length: int = 10) -> None:
        self.user_conversation_history: DefaultDict[str, List[str]] = defaultdict(list)
        self.max_length = max_length

    def add_to_history(self, user_id: str, user_input: str, response: str) -> None:
        history = self.user_conversation_history[user_id]
        history.append(f"USER: {user_input}\n")
        history.append(f"JANET: {response}\n")
        self.user_conversation_history[user_id] = history[-self.max_length :]

    def get_history(self, user_id: str) -> List[str]:
        return self.user_conversation_history[user_id]

    def clear_history(self, user_id: str) -> None:
        self.user_conversation_history[user_id] = []
