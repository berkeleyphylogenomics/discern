import os

column_to_sort_by = 3


def sort_file_by_column(filename):
    d_list = [line.strip() for line in open(filename) if not line.strip() ==""]
    d_list.sort(key = lambda line: line.split()[column_to_sort_by])
    return ["%s\t%s" % (value, ind) for ind, value in enumerate(d_list)
