bedtools makewindows -g hg16-main.chrom.sizes -w 1000000 > hg16-1mb.bed

bedtools intersect -c  -a hg16-1mb.bed -b hg16-kc.bed > hg16-kc-count.bed 

#number of genes in hg19
wc hg19-kc.bed
#80270 genes

#number of genes in hg19 but not in hg16
bedtools intersect -v -a hg19-kc.bed -b hg16-kc.bed | wc  
#42717 genes in hg19 not in hg16

#why some genes not in hg16 that are in hg19?
#hg19 is a much newer version of hg16, as such it has a greater quantity of genes sequenced 
#(becasue of greater gene detection, can more easily identify previously unknown genes)
#it's just newer, has more stuff! 

#number of genes in hg16
wc hg16-kc.bed
#21365 genes

#number of genes in hg16 but not in hg19
bedtools intersect -v -a hg16-kc.bed -b hg19-kc.bed | wc
#3460 genes

#why some genes not in hg19 that are in hg16?
#So this question is a bit more difficult...it could simply be the fact that there are mistakes in hg16 that added genes that don't exist
#hg16 is much less updates, so scientists then could have been:
#looking at 2 alles of genes and thought they were 2 seperate genes --> in reality, the're just 1 gene!
#thinking that two regions of same gene were actually 2 different genes --> turns out to be same gene!