from collections import defaultdict
from typing import List, DefaultDict

from history.history_item_interface import HistoryItemInterface


class HistoryHandler:
    def __init__(self, max_length: int = 10) -> None:
        self.user_conversation_history: DefaultDict[str, List[HistoryItemInterface]] = \
            defaultdict(list)
        self.max_length = max_length

    def add_to_history(self, user_id: str, user_input: HistoryItemInterface, response: HistoryItemInterface) -> None:
        history = self.user_conversation_history[user_id]
        history.append(user_input)
        history.append(response)
        self.user_conversation_history[user_id] = history[-self.max_length:]

    def get_history(self, user_id: str) -> List[HistoryItemInterface]:
        return self.user_conversation_history[user_id]

    def clear_history(self, user_id: str) -> None:
        self.user_conversation_history[user_id] = []
