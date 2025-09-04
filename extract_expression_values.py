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

#open file, compare with dictionary
#if present, add to list corresponding with characteristic
#print string of all lists put together like a family
  