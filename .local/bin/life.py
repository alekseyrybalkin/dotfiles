#!/usr/bin/env python2

from datetime import date, datetime

now = datetime.now()
death = datetime(2077, 10, 23)
print (death-now).days
