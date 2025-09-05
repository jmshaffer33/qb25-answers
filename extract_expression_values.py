#!/usr/bin/env python3

import sys

expression_file = open(sys.argv[1])
skipped_first_line = expression_file.readline()
skipped_second_line = expression_file.readline()

header = expression_file.readline().rstrip().split("\t")
data = expression_file.readline().rstrip().split("\t")

expression_dict = {}

for value in range(len(header)):
    entry = header[value]
    expression_dict[entry] = data[value]

#sys connects terminal to python, so run script by running in terminal to check
#sys.argv[1] represents the first terminal argument, usually the file name....so opening file of interest!
#isolating and parseing into header and data lines, where header is SAMPID and data is expression values for gene DDX11L1
#open empty expression_dict to fill with keys(SAMPID) and values(expression values)
#enter for loop stepping through each value across length of entire header line
#entry = SAMPID, specified by positions of header --> key
#populate dictionary --> value = expression values in data line at given matchingposition in header



metadata_file = open("/Users/cmdb/qb25-answers/GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt")

for line in metadata_file:
    line_no_newlines = line.rstrip("\n")
    line_parsed_final = line_no_newlines.split("\t")
    if line_parsed_final[0] in expression_dict:
        SAMPID = line_parsed_final[0]
        Tissue = line_parsed_final[6]
        Expression = expression_dict[SAMPID]
    else:
        continue
    print(f"Tissue: {Tissue}\t SAMPID: {SAMPID}\t Expression: {Expression}\n")

metadata_file.close()

#answers to first 3 tissues >0 expression: 
#Brain - Cortex
#Adrenal Gland 
#Thyroid

#open metadata file
#compare SAMPID from metadatafile with expression_dict
#enter for loop stepping through each line in metadata_file
#parse metadata_file into list so can analyze individual values by removing newlines and splitting tabs
#SAMPID in metadata_file at index[0]
#if same SAMPID is in metadata_file and dictionary, add those SAMPIDs as new list
#Add corresponding tissue, index[6] to new list
#Add corresponding expression, value from expression_dict to new list
#if SAMPID from metadata_file not in expression_dict, skip
#print string of all lists put together like a happy family!

#to identify first 3 tissues >0 expression, scroll through printed string and write down tissues where expression >0


  