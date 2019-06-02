# Copyright (c) 2014-2019 Aleksey Rybalkin
# SPDX-License-Identifier: GPL-3.0+
import sys


# this disables interactive logging in python 3 console
sys.__interactivehook__ = lambda: None


# slightly better `dir`
def xdir(obj):
    for i in dir(obj):
        if not i.startswith('_'):
            print(i)
