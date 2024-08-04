from abc import ABC, abstractmethod
from typing import List, Optional

from history.history_item_interface import HistoryItemInterface


class Model(ABC):
    @abstractmethod
    def generate_response(self, query: str, history: Optional[List[HistoryItemInterface]] = None) -> str:
        pass
