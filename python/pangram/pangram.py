import re
import string


def is_pangram(sentence):
    normalized_sentence = re.sub("[^A-Za-z]", "", sentence).lower()
    return set(normalized_sentence) == set(string.ascii_lowercase)
