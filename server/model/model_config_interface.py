from abc import ABC, abstractmethod
from dataclasses import dataclass


@dataclass(frozen=True)
class ModelConfigInterface(ABC):
    @property
    @abstractmethod
    def user_identifier(self) -> str:
        pass

    @property
    @abstractmethod
    def assistant_identifier(self) -> str:
        pass

    @property
    @abstractmethod
    def prefix_string(self) -> str:
        pass
