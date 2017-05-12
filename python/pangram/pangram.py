import re, string

def is_pangram(sentence):
    normalized_sentence = re.sub("[^A-Za-z]", "", sentence).lower()
    return "".join(sorted(set(normalized_sentence))) == string.ascii_lowercase

