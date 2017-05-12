import re


def is_isogram(string):
    normalized = re.sub("[^A-Za-z]", "", string.lower())
    return len(list(normalized)) == len(set(normalized))
