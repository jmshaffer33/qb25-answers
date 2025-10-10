#!/usr/bin/env python3

import sys

sequence_alignment_count_dict = {}
sequence_mismatch_count_dict = {}

sequence_data = open(sys.argv[1])
for line in sequence_data:
    if line.startswith("@"):
        continue
    sequence_data_parse1 = line.strip("\n")
    sequence_data_parse2 = sequence_data_parse1.split("\t")

    RNAME=sequence_data_parse2[2]
    

    if RNAME not in sequence_alignment_count_dict:
        sequence_alignment_count_dict[RNAME] = 1
    else:
        sequence_alignment_count_dict[RNAME] += 1 
        

    for column in sequence_data_parse2:
        if column.startswith("NM"):

            mismatch_count = int(column[5:])

            if mismatch_count not in sequence_mismatch_count_dict:
                sequence_mismatch_count_dict[mismatch_count] = 1
            else:
                sequence_mismatch_count_dict[mismatch_count] += 1 

for key in sequence_alignment_count_dict.keys():
    print(key, sequence_alignment_count_dict[key])


keys_list = sequence_mismatch_count_dict.keys()
keys_list_sorted = sorted(keys_list)

for keys2 in keys_list_sorted:
    print(keys2, sequence_mismatch_count_dict[keys2])

    
#if statement defines what is in dictionary, key = RNAME and value = count 
