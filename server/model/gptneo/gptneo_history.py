from history.history_item_interface import HistoryItemInterface
from .gptneo_config import GptNeoConfig

class GptNeoHistory(HistoryItemInterface):
    def __init__(self, text, is_user_input):
        super().__init__(text, is_user_input)

    def __str__(self):
        return f"{GptNeoConfig.USER_IDENTIFIER if self.is_user_input else GptNeoConfig.ASSISTANT_IDENTIFIER}: {self.text}"
