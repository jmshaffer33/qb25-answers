For Q1
bowtie2-build sacCer3.fa sacCer3

bowtie2 -p 4 -x ../genomes/sacCer3 -U ~/Data/BYxRM/fastq/A01_01.fq.gz > A01_01.sam

samtools sort -o A01_01.bam A01_01.sam

samtools index A01_01.bam

samtools idxstats A01_01.bam > A01_01.idxstats


For Q2
How this visualization compares to haplotypes in BYxRM_GenoData.txt
Do some look more similar to eachothe than to others?
1, 3, 4 have the same coverage pattern. Comparison with the BYxRM_GenoData.txt shows that these three are of the B haplotype.
2, 5, 6 have the same coverage pattern. Comparsion with the BYxRM_GenoData.txt shows that these three are of the R haplotype. 

For Q4
minimap2 -a -x map-ont sacCer3.fa ERR8562478.fastq > longreads.sam  

samtools sort -o longread.bam longreads.sam

samtools index longreads.bam 

samtools idxstats longreads.bam > longreads.idxstats

For Q5
hisat2 -p 4 -x ../rawdata/sacCer3 -U ../rawdata/SRR10143769.fastq > mapped_SRR10143769.sam

samtools sort -o mapped_SRR10143769.bam mapped_SRR10143769.sam

samtools index mapped_SRR10143769.bam 

The genes appear to have the most coverage, appear to be the most active, at the 3' end. 