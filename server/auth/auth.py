from secret import AUTH_KEY


def check_auth(token: str) -> bool:
    return token == AUTH_KEY
