from auth.secret import AUTH_KEY


def check_auth(token: str) -> bool:
    # TODO: Implement this function
    return token == AUTH_KEY
