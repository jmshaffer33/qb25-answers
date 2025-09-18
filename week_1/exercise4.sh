bedtools intersect -c -a hg19-kc.bed -b snps-chr1.bed | sort -n -k 5 | tail
#systemic name: ENST00000490107.6_7
#human readable name: SYMD3
#position: hg19 chr1:245,912,649-246,670,581
#size: 757,933
#exon count: 12
#This gene likely has the most SNPs because the gene is incredibly large--it's 12 exons long!! 
#With so many bases within the gene, the probability increases that one of those is a SNP just because there's so many

bedtools sample -n 20 -seed 42 -i snps-chr1.bed > sampled-snps-chr1.bed

bedtools sort -i sampled-snps-chr1.bed > sorted-snps-chr1.bed

bedtools sort -i hg19-kc.bed > sorted-hg19-kc.bed

#how many SNPs are inside a gene?
bedtools closest -d -t first -a sorted-snps-chr1.bed -b sorted-hg19-kc.bed | wc
#15 SNPs because distance (number of bases) away from gene is = 0 
#1664-22944 nt is the range of distance for SNPs outside a gene

