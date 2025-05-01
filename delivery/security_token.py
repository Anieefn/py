import random
import string
def generate_token():
    """
    The token is created using a mix of:
    - Uppercase and lowercase English letters (A-Z, a-z)
    - Digits (0-9)
    - Punctuation symbols

    Returns:
        str: A randomly generated 10-character token.
    """
    characters = string.ascii_letters + string.ascii_lowercase + string.digits + string.punctuation
    return ''.join(random.choice(characters)for _ in range(10))
