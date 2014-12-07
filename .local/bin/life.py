#!/usr/bin/env python2

from datetime import date, datetime

now = datetime.now()
death = datetime(2050, 1, 1)
print (death-now).days
