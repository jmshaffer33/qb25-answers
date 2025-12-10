#!/usr/bin/env python3

reads = ['ATTCA', 'ATTGA', 'CATTG', 'CTTAT', 'GATTG', 'TATTT', 'TCATT', 'TCTTA', 'TGATT', 'TTATT', 'TTCAT', 'TTCTT', 'TTGAT']
k = 3 

graph = set()

for sequence in reads:
  for i in range(len(sequence) - k):
     kmer1 = sequence[i: i+k]
     kmer2 = sequence[i+1: i+1+k]
     graph.add(f"{kmer1} -> {kmer2}")

print("digraph {")
for edge in graph:
   print(edge)
print("}")

# need to generate output file in .dot format to use dot graphviz on command line
# ./de_bruijn.py > de_bruijn.dot