#!/bin/bash

#Question1
wc -l ce11_genes.bed
#53935 ce11_genes.bed

cut -f 1 ce11_genes.bed | sort | uniq -c
#5460 chrI
#6299 chrII
#4849 chrIII
#21418 chrIV
#12 chrM
#9057 chrV
#6840 chrX

cut -f 6 ce11_genes.bed | sort | uniq -c
#26626 -
#27309 +

#Question2
chmod -x recalculate_score.py
./recalculate_score.py ce11_genes.bed
#bed file w/ new_score_final printed in column 5
#do you guys want the actual printed output?? it seems like too much

#Question3
cut -f 7 GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt | sort | uniq -c | sort | tail -n 3
#867 Lung
#1132 Muscle - Skeletal
#3288 Whole Blood

grep -c "RNA" GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt
#20017

grep -v -c "RNA" GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt
#2935

#Question4
chmod -x extract_expression_values.py
./extract_expression_values.py GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct

# I <3 <3 unix this is so much more fun :D :D :D 