# Copyright (c) 2014-2020 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+
import itertools
import math
import os
import shutil
import sys
import datetime as dt


# this disables interactive logging in python 3 console
sys.__interactivehook__ = lambda: None


# slightly better `dir`
def xdir(obj=None):
    attr_list = dir(obj) if obj is not None else globals()
    attrs = [attr for attr in attr_list if not attr.startswith('_')]
    if not attrs:
        return

    sep = 3
    term_len = shutil.get_terminal_size().columns
    max_len = max(len(attr) for attr in attrs)
    columns = term_len // (max_len + sep)
    rows = (len(attrs) // columns) + (1 if len(attrs) % columns else 0)

    batches = [attrs[x * rows:(x + 1) * rows] for x in range(columns)]

    for line in itertools.zip_longest(*batches, fillvalue=''):
        print((' ' * sep).join(['{:>' + str(max_len) + '}'] * columns).format(*line))
