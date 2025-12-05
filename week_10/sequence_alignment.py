#!/usr/bin/env python3

import sys

import numpy as np

from fasta import readFASTA

sequences_file = readFASTA(open(sys.argv[1]))

seq1_id, sequence1 = sequences_file[0]
seq2_id, sequence2 = sequences_file[1]

scoring_file = open(sys.argv[2])
sigma = {}
alphabet = scoring_file.readline().strip().split()
for line in scoring_file:
	line = line.rstrip().split()
	for i in range(1, len(line)):
		sigma[(alphabet[i - 1], line[0])] = float(line[i])
scoring_file.close()

f_matrix = np.zeros((len(sequence1) + 1, len(sequence2) + 1) , dtype = int)
traceback_matrix = np.empty((len(sequence1) + 1, len(sequence2) + 1), dtype = str)

gap_penalty = int(sys.argv[3])

# fill in f_matrix and traceback_matrix
for j in range(1, len(sequence2) + 1):
    f_matrix[0, j] = f_matrix[0, j - 1] + gap_penalty

for j in range(0, len(sequence2)+ 1):
    if j == 0:
         traceback_matrix[0, j] = "0"
    else: 
         traceback_matrix[0, j] = "d"

	
for i in range(1, len(sequence1) + 1):
    f_matrix[i, 0] = f_matrix[i - 1, 0] + gap_penalty

for i in range(0, len(sequence1) + 1):
    if i == 0:
         traceback_matrix[i, 0] = "0"
    else: 
         traceback_matrix[i, 0] = "h"

for i in range(1, len(sequence1) + 1):
     for j in range(1, len(sequence2) + 1):
         v_score = gap_penalty + f_matrix[i - 1, j]
         h_score = gap_penalty + f_matrix[i, j - 1]
         if sequence1[i - 1] == sequence2[j - 1]:
            d_score = sigma[sequence1[i - 1],sequence2[j - 1]] + f_matrix[i - 1, j - 1]
         else: 
            d_score = sigma[sequence1[i - 1],sequence2[j - 1]] + f_matrix[i - 1, j - 1]

         f_matrix[i,j] = max(v_score, h_score, d_score)

         if f_matrix[i, j] == d_score:
            traceback_matrix[i, j] = "d"
        
         if f_matrix[i, j] == h_score:
            traceback_matrix[i, j] = "h"
        
         if f_matrix[i, j] == v_score:
            traceback_matrix[i, j] = "v"

# find the optimal alignment and work way back to top left from bottom right
i = len(sequence1)
j = len(sequence2)

seq1_alignment = ''
seq2_alignment = ''
 
while i != 0 or j != 0:
    if traceback_matrix[i,j] == "d":
          seq1_alignment = seq1_alignment + sequence1[i - 1]
          seq2_alignment = seq2_alignment + sequence2[j - 1]
          i -= 1
          j -= 1

    if traceback_matrix[i,j] == "h":
          seq1_alignment = seq1_alignment + sequence1[i - 1]
          seq2_alignment = seq2_alignment + "-"
          j -= 1

    if traceback_matrix[i,j] == "v":
          seq1_alignment = seq1_alignment + "-"
          seq2_alignment = seq2_alignment + sequence2[j - 1]
          i -= 1


# write output file
output_file = open(sys.argv[4], 'w')

output_file.write(f"sequence1_alignment: {seq1_alignment}\n")
output_file.write(f"sequence2_alignment: {seq2_alignment}\n")

seq1_number_of_gaps = 0
for character in seq1_alignment:
     if character == "-":
          seq1_number_of_gaps += 1
     else:
          seq1_number_of_gaps += 0
output_file.write(f"sequence1_number_of_gaps: {seq1_number_of_gaps}\n")

seq2_number_of_gaps = 0
for character in seq2_alignment:
     if character == "-":
          seq2_number_of_gaps += 1
     else:
          seq2_number_of_gaps += 0
output_file.write(f"sequence2_number_of_gaps: {seq2_number_of_gaps}\n")

seq1_matches = ''
for i in range(len(seq1_alignment)):
	if seq1_alignment[i] == seq2_alignment[i]:
		seq1_matches += '|'
	else:
		seq1_matches += ' '
seq1_identity = seq1_matches.count("|")/len(sequence1) * 100

output_file.write(f"percent_sequence1_identity: {seq1_identity}\n")

seq2_matches = ''
for i in range(len(seq2_alignment)):
	if seq1_alignment[i] == seq2_alignment[i]:
		seq2_matches += '|'
	else:
		seq2_matches += ' '
seq2_identity = seq2_matches.count("|")/len(sequence2) * 100

output_file.write(f"percent_sequence2_identity: {seq2_identity}\n")


alignment_score = f_matrix[len(sequence1), len(sequence2)]
output_file.write(f"alignment_score: {alignment_score}\n")

#./sequence_alignment.py CTCF_38_M27_AA.faa BLOSUM62.txt -10 AA_alignment.txt
#./sequence_alignment.py CTCF_38_M27_DNA.fna HOXD70.txt -300 DNA_alignment.txt    
