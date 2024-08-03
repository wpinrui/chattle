from history.history_item_interface import HistoryItemInterface
from .dialogpt_config import DialoGptConfig


class DialoGptHistory(HistoryItemInterface):
    def __init__(self, text, is_user_input):
        super().__init__(text, is_user_input)

    def __str__(self):
        return f"{DialoGptConfig.USER_IDENTIFIER if self.is_user_input else DialoGptConfig.ASSISTANT_IDENTIFIER}: {self.text}"
