#!/bin/bash

cd BYxRM_bam

for sample in A01_09 A01_11 A01_23 A01_24 A01_27 A01_31 A01_35 A01_39 A01_62 A01_63
do
    #samtools index $sample.bam
    samtools view -c $sample.bam >> ../read_counts.txt
    echo $sample.bam >> ../bamListFile.txt

done


freebayes -f sacCer3.fa -L bamListFile.txt --genotype-qualities -p 1 > unfiltered.vcf