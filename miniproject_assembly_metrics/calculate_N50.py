#!/usr/bin/env python3

import sys
import fasta 

worm_genome = open(sys.argv[1])
contigs = fasta.FASTAReader(worm_genome)

number_of_contigs = 0
total_length = 0

contig_length_list = []

for identity,sequence in contigs: 
    length = len(sequence)
    total_length += length
    number_of_contigs += 1

    contig_length_list.append(length)
    contig_length_list.sort(reverse=True)
    
half_total_length = total_length / 2
contig_length_count = 0

for contig in contig_length_list: 
    contig_length_count += contig
    if contig_length_count >= half_total_length:
        break
    
print(f"Sequence length of the shortest contig at 50% of the total assembly length {contig}")

#sorry! I made a new script instead of extending assembly_metrics.py 
#I copied large portions of assembly_metrics.py for this script, so hopefully equivalent
#I just removed lines about averages and prev print statement, since not needed for Q5

#import sys and fasta so can connect python script to terminal and use fasta commands 
#open worm_geneome file from terminal, given as second command line argument
#want to count total number of contigs and total length of sequence
#so make respective variables =0 so each time loop runs, # will change
#enter loop stepping through contigs in converted(?) worm_genome file
#length of a given contig is calculated as length of sequence
#total length is calculated by adding each length together as a new one is calculated each time loop runs
#number_of_contigs increases by 1 each time loop runs through new row, counting contigs
#fill new list contig_length_list by appending invidvidual contig length counts
#reverse sort contig_length list so biggest contigs first, smallest contigs last

#N50 is sequence length of the shortest contig at 50% of the total assembly length
#so need to exit loop to calculate half_of_total_lengh by dividing final total_length (ie value stops changing) by 2
#want to count total contig length so make variable =0 so each time loop runs, # will change

#enter loop stepping through contigs in contig_length_list
#contig_length_count is calculated by adding each contig together as a new one is calculated each time loop runs
#stop counting (ie break loop) when the total contig_length_count exceeds the half_total_length (ie calculating N50)
#length of the final contig added to total is stored in contig variable when loop breaks

#print string listing length of N50

#wowie wowie all done now!! :D :D :D :) :) :)  
