#!/usr/bin/env python3

print("allele_frequency")
#print("depths")

for line in open("biallelic.vcf"):
    if line.startswith('#'):
        continue
    fields = line.rstrip('\n').split('\t')

    INFO= fields[7].split(';')

    for column in INFO:
        if column.startswith("AF"):
            print(column[3:])


    #for sample in fields[9:]:
        #parsed_sample = sample.split(":")
        #print(parsed_sample[2])


#instructions: need to generate two seperate files with different names
#have been running the py script in the terminal and printing files with the >
#when generating each file, must comment out for loop and print statment for AF to get DP file and vice versa
#./ex2.py > AF.txt
#./ex2.py > DP.txt 


#when in INFO field (7th column of big file), if see AF print the 3rd character and beyond

#sample is the columns beyond index 9 of big file
#want the second part after : for the DP values
