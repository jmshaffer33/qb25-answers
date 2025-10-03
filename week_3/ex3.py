#!/usr/bin/env python3

#Which samples do you think derive from the lab strain, 
#And which samples do you think derive from the wine strain in this region of the genome?
#Offspring should exhibit a 50/50 split between parental type alleles (i.e 50/50 split between lab and wine strain), following recombination. 
#This explains the peak in the histogram at 0.5; all other values follow a normal distribution. 

# sample IDs (in order, corresponding to the VCF sample columns)
sample_ids = ["A01_62", "A01_39", "A01_63", "A01_35", "A01_31",
              "A01_27", "A01_24", "A01_23", "A01_11", "A01_09"]

print(f"Chrom\t Pos\t Sample_id \t Genotype")

for line in open("biallelic.vcf"):
    if line.startswith('#'):
        continue
    fields = line.rstrip('\n').split('\t')

    chrom = fields[0]
    pos   = fields[1]

    column_counter = 0

    for sample in fields[9:]:
        parsed_sample = sample.split(":")


        if parsed_sample[0] == "0":
            print (f"{chrom}\t {pos}\t {sample_ids[column_counter]} \t O")
        if parsed_sample[0] == "1":
            print (f"{chrom}\t {pos}\t {sample_ids[column_counter]}\t 1")

        column_counter += 1 


#run in terminal with line to generate file output
#./ex3.py > gt_long.txt
    

