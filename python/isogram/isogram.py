import re


def is_isogram(string):
    normalized = re.sub("[^A-Za-z]", "", string.lower())
    return len(normalized) == len(set(normalized))
