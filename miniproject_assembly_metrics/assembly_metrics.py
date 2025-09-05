#!/usr/bin/env python3

import sys
import fasta 

worm_genome = open(sys.argv[1])
contigs = fasta.FASTAReader(worm_genome)

number_of_contigs = 0
total_length = 0

for identity,sequence in contigs: 
    length = len(sequence)
    total_length += length
    number_of_contigs += 1
length_mean = total_length / number_of_contigs

print(f"Number of contigs {number_of_contigs}\t Total length {total_length}\t Average length {length_mean}\n")

#import sys and fasta so can connect python script to terminal and use fasta commands 
#open worm_geneome file from terminal, given as second command line argument
#want to count total number of contigs and total length of sequence
#so make respective variables =0 so each time loop runs, # will change
#enter loop stepping through contigs in converted(?) worm_genome file
#length of a given contig is calculated as length of sequence
#total length is calculated by adding each length together as a new one is calculated each time loop runs
#number_of_contigs increases by 1 each time loop runs through new row, counting contigs

#exit loop to calculate average length (total length / total number of contigs)

#print string listing number of contigs, total length, and average length of each C. remanei genome


#identity,sequence is same as identity = contigs[0] / sequence = contigs[1], only used in for loop
