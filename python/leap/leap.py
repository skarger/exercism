def is_leap_year(year):
    """Returns True if given year is a leap year, False otherwise"""
    return (year % 4 == 0) and (year % 100 != 0 or year % 400 == 0)
