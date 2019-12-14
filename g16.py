#!/usr/bin/python
# -*- coding: utf-8 -*-

__author__ = 'Selbi Nuryyeva'

# Python code that prepares an .sh file for Gaussian16 software and submits it to Hoffman2 cluster

# Code recognizes the following input format:
# 'python g16.py file.com 3 3072 24' (without alias)
# 'g16 file.com 3 3072 24' (with alias)
# 3 is number of cores, 3072 is memory/core in MB, 24 is hours requested

# Below, change the username to yours --> '/s/selbi' part
# And in submit_g16.py, change the name to yours

import sys
import os

filename = sys.argv[1][:-4] + '.sh'

with open("/u/home/s/selbi/scripts/submit_g16.sh", 'U') as f:
        newText=f.read()
        newText = newText.replace('NUMCORES', sys.argv[2])
        newText = newText.replace('MEMREQ', sys.argv[3])
        newText = newText.replace('TIMEREQ', sys.argv[4])

with open(filename, "w") as f:
        f.write(newText)

os.system("qsub %s" %filename)
