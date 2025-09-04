#!/usr/bin/env python3

import sys

expression_file = open(sys.argv[1])
skipped_first_line = expression_file.readline()
skipped_second_line = expression_file.readline()

header = expression_file.readline().rstrip().split("\t")
data = expression_file.readline().rstrip().split("\t")

expression_dict = {}

#for values in expression_file:
#need to make dictionary loop here...........didn't go great the first time I tried........

#"this could be the start of something neeeeew, it feels so right to be here with you ooooooooh"
#"and now looking in your eyeeeeeees, I feeeeeel in my hearttttt"
#"The start of something new"
#-Troy and Gabriella Highschool Musical
    