#!/usr/bin/env python3

import numpy as np
import random
from scipy import stats

genome_size = 1000000
read_length = 100
coverage = 30

num_reads = int(genome_size * coverage / read_length)

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeros(genome_size, dtype = int) 

for i in range(num_reads):

  startpos = random.randint(0, genome_size-read_length + 1)
  #selected random index as start position, looked it up sad sad
  endpos = startpos + read_length
  genome_coverage[startpos:endpos] += 1

## get the range of coverages observed
max_coverage = max(genome_coverage)
xs = list(range(0, max_coverage + 1))

for character in genome_coverage:
  print(f"{int(character)}\n")

## Get the poisson pmf at each of these
poisson_estimates = stats.poisson.pmf(xs, coverage) * genome_size
# for value in poisson_estimates:
#   print(f"{value}\n")

## Get normal pdf at each of these (i.e. the density between each adjacent pair of points)
normal_estimates = stats.norm.pdf(xs, loc = coverage, scale = np.sqrt(coverage)) * genome_size
# for position in normal_estimates:
#   print(f"{position}\n")


## Print text files by commenting out the print statments not needed and > file name on terminal change by if 3x, 10x, 30x
# ./genome_assembly.py > genome_coverage_##x.txt
# ./genome_assembly.py > poisson_estimates_##x.txt
# ./genome_assembly.py > normal_estimates_##x.txt


