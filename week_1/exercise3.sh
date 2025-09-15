#is there any overlap between 1_Active and 12_Repressed in a given condition
bedtools intersect -wa -a nhek-active.bed -b nhek-repressed.bed | wc
#0 regions overlap in NHEK between active and repressed states

#find regions that are active in NHEK and NHLF
bedtools intersect -a nhek-active.bed -b nhlf-active.bed | wc 
#12174 active regions in both 

#find regions active in NHEK but not NHLF
bedtools intersect -v -a nhek-active.bed -b nhlf-active.bed | wc
#2405
wc nhek-active.bed
#14013 regions
#Do not add up to total number of active regions in nhek-active.bed bc counts each region multiple times, each time it overlaps

#find regions that are active in NHEK and NHLF, only reporting one feature per overlap
bedtools intersect -u -a nhek-active.bed -b nhlf-active.bed | wc 
#11608 regions active in both, only reporting one feature per overlap

bedtools intersect -f 1 -a nhek-active.bed -b nhlf-active.bed 
#100% of A covered by B (NHLF region bigger)
#chr1	25558413	25559413
bedtools intersect -F 1 -a nhek-active.bed -b nhlf-active.bed 
#100% % B covered by A (NHEK region bigger)
#chr1	19923013	19924213
bedtools intersect -f 1 -F 1 -a nhek-active.bed -b nhlf-active.bed 
#when both fully cover eachother, A = B (NHEK region = NHLF region)
#chr1	1051137	1051537
#provides list of all the regions that match these criteria 
#go to different regions on different chromosomes in different tissues criteria where this is met

#Active in NHEK, Active in NHLF
bedtools intersect -a nhek-active.bed -b nhlf-active.bed | head
#in active-active chromatin in all 9 regions are active

#Active in NHEK, Repressed in NHLF
bedtools intersect -a nhek-active.bed -b nhlf-repressed.bed | head
#in active-repressed chromatin in 4 of 9 regons are active; mixed active and repressed regions

#Repressed in NHEK, Repressed in NHLF
bedtools intersect -a nhek-repressed.bed -b nhlf-repressed.bed | head
#in repressed-repressed chromatin in all 9 regions are repressed