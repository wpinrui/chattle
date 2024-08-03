from abc import abstractmethod


class HistoryItemInterface:
    def __init__(self, text, is_user_input):
        self.text = text
        self.is_user_input = is_user_input

    @abstractmethod
    def __str__(self):
        pass
