bedtools makewindows -g hg16-main.chrom.sizes -w 1000000 > hg16-1mb.bed

bedtools intersect -c  -a hg16-1mb.bed -b hg16-kc.bed > hg16-kc-count.bed 

#number of genes in hg19
wc hg19-kc.bed
#80270 genes

#number of genes in hg19 but not in hg16
bedtools intersect -v -a hg19-kc.bed -b hg16-kc.bed | wc  
#42717 genes in hg19 not in hg16

#why some genes not in hg16 that are in hg19?
#greater gene detection 
#greater quantity of genes sequenced by time of hg19 vs hg16