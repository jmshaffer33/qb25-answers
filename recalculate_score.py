#!/usr/bin/env python3

import sys

worm_data = open(sys.argv[1])
for line in worm_data:
    worm_data_parse1 = line.strip("\n")
    worm_data_parse2 = worm_data_parse1.split("\t")
    start = int(worm_data_parse2[1])
    end = int(worm_data_parse2[2])
    original_score = int(worm_data_parse2[4])
    length=(end-start)
    new_score = original_score * length
    strand = worm_data_parse2[5]
    if strand == "+":
        new_score_final = new_score * 1
    if strand == "-":
        new_score_final = new_score * -1 
    
    print(worm_data_parse2[0],"\t", start, "\t", end, "\t", worm_data_parse2[3], "\t", new_score_final, "\t", strand)

#sys connects terminal to python, so run script by running in terminal to check
#sys.argv[1] represents the first terminal argument, usually the file name....so opening file of interest!
#parse worm_data into list so can analyze individual values by removing newlines and splitting tabs
#integerize start and end base columns so can calculate gene length
#integerize oriignal score column so can calculate new score using equation provided
#calculate new score
#identify strand column
#if value in strand column is +, multiply new_score_final by 1 to make positive
#if value in strand column is -, multiple new_score_final by -1 to make negative
#print results in same organization as original bed format chart
#run script in terminal to check!

# :D :D :D :D yayayayay it worked :) :) :) 
