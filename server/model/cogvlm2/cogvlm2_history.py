from server.history.history_item_interface import HistoryItemInterface
from server.model.cogvlm2.cogvlm2_config import CogVLM2Config

class Cogvlm2History(HistoryItemInterface):
    def __init__(self, text, is_user_input):
        super().__init__(text, is_user_input)

    def __str__(self):
        return f"{CogVLM2Config.USER_IDENTIFIER if self.is_user_input else CogVLM2Config.ASSISTANT_IDENTIFIER}: {self.text}"
