library(DESeq2)
library(tidyverse)
library(broom)
setwd ("/Users/cmdb/qb25-answers/week_8/")

#Q1
metadata_df <- read_delim("gtex_metadata_downsample.txt")
metadata_df <- column_to_rownames(metadata_df, var = "SUBJECT_ID")

counts_df <- read_delim("gtex_whole_blood_counts_downsample.txt")
counts_df <- column_to_rownames(counts_df, var = "GENE_NAME")

colnames(counts_df) == rownames(metadata_df)

dds <- DESeqDataSetFromMatrix(countData = counts_df, 
                              colData = metadata_df,
                              design = ~ SEX + AGE + DTHHRDY)
vsd <- vst(dds)
plotPCA(vsd, intgroup = "SEX")
plotPCA(vsd, intgroup = "AGE")
plotPCA(vsd, intgroup = "DTHHRDY")
# What proportion of variance in the gene expression data is explained by each of the first two principal components? 
#PC1 = 48% / PC2 = 7% 
#Which principal components appear to be associated with which subject-level variables? 
#PC1 of DTHHRDY

#Q2
vsd_df <- assay(vsd) %>%
  t() %>%
  as_tibble()

vsd_df <- bind_cols(metadata_df, vsd_df)

m1 <- lm(formula = WASH7P ~ DTHHRDY + AGE + SEX, data = vsd_df) %>%
  summary() %>%
  tidy()
#Does WASH7P show significant evidence of sex-differential expression (and if so, in which direction)?
#WASH7P does not show significant evidence of sex-differential expression (p-value = 2.792437e-01 > 0.05)

m2 <- lm(formula =  SLC25A47 ~ DTHHRDY + AGE + SEX, data = vsd_df) %>%
  summary() %>%
  tidy()
#Does SLC25A47 show significant evidence of sex-differential expression (and if so, in which direction)?
#SLC25A47 does show significant evidence of sex-differential expression (p-value = 2.569926e-02 > 0.05) 
#Upregulated expression in the direction of males

dds <- DESeq(dds)
res_sex <- results(dds, name = "SEX_male_vs_female")  %>%
  as_tibble(rownames = "GENE_NAME")

#How many genes exhibit significant differential expression between males and females at a 10% FDR?
filter(res_sex, padj <= 0.1) %>% filter(!is.na(padj)) %>% dim()
#262 genes exhibit significant differential expression between males and females at a 10% FDR

gene_locations <- read_delim("gene_locations.txt")

mapped_dds <- left_join(res_sex, gene_locations, by = "GENE_NAME")
padj_order <- order(mapped_dds$padj, decreasing = FALSE)
ordered_dds <- mapped_dds[padj_order,]

#Which chromosomes encode the genes that are most strongly upregulated in males versus females, respectively? 
#Y chromosome encodes genes that are most strongly upregulated in males
#X chromosome encodes genes that are most strongly upregulated in females
#(look log2FoldChange: if (+) = chrom most strong in males / if (-) = chrom most strong in females)

#Are there more male-upregulated genes or female-upregulated genes near the top of the list?
#More male genes are near the top of the list

#Are the results broadly consistent for WASH7P and SLC25A47?
#Yes the results are broadly consistent! 
#SLC25A47 expression is significantly upregulated in the direction of males (p-value = .00000000105 < 0.05, with pos log2FoldChange value)
ordered_dds %>% filter(GENE_NAME == "SLC25A47")

#WASH7P does not show significant sex diffrentiated expression (p-value = 0.46 > 0.05, not significant)
ordered_dds %>% filter(GENE_NAME == "WASH7P")

#Reflect on how your analysis illustrates the trade-off between false positives and false negatives. 
#For example, what happens if you use a very stringent FDR threshold (e.g., 1 %) versus a lenient one (e.g., 20 %)? 
#Which type of error (false positive or false negative) would you expect to increase or decrease under each scenario? 
#Briefly comment on how sample size and effect size might influence the power of your analysis to detect truly differentially expressed genes.

#When you utilize a stringent FDR threshold, you increase the chance of false negatives (bc low FDR increases the proportion of negative results, so results that are actually significant aren't caught by the FDR threshold) 
#While decreasing the chance of false positives (bc FDR so low, fewer values are under threshold, so fewer positive, significant results)
#So when you take steps to limit false positives, you increase the chance of false negatives...and vice versa = tradeoff!
#Increasing the sample size dilutes the impact of outliers in the dataset, thereby reducing the chance of false positives since individual significant results become less powerful (you feel less effect from a potentially significant outlier)
#In this case, increased sample size allows for stronger capacity to detect truly differentially expressed genes (ie limit fasle postives)

res_DTHHRDY <- results(dds, name = "DTHHRDY_ventilator_case_vs_fast_death_of_natural_causes")  %>%
  as_tibble(rownames = "GENE_NAME")

#How many genes exhibit significant differential expression between males and females at a 10% FDR?
filter(res_DTHHRDY, padj <= 0.1) %>% filter(!is.na(padj)) %>% dim()
#16069 genes exhibit significant differential expression between males and females at a 10% FDR

shuffled_sex_df <- transform(metadata_df, SEX = sample(SEX))
#looked it up bc brain small no ideas

dds_shuffled <- DESeqDataSetFromMatrix(countData = counts_df, 
                              colData = shuffled_sex_df,
                              design = ~ SEX + AGE + DTHHRDY)
dds_shuffled <- DESeq(dds_shuffled)
res_sex_shuffled <- results(dds_shuffled, name = "SEX_male_vs_female")  %>%
  as_tibble(rownames = "GENE_NAME")


#How many genes appear “significant” in this permuted analysis at a 10 % FDR?
filter(res_sex_shuffled, padj <= 0.1) %>% filter(!is.na(padj)) %>% dim()
#18 genes appear significant at a 10% FDR 

#What does this suggest about how well the FDR threshold controls the expected rate of false discoveries in large-scale RNA-seq experiments?
#262 vs 18 genes
#FDR % of discoveries = # of false positives 
#0.1(262) = 20 ~ 18 false positives
#Yes, the FDR did its job! After shuffling, the significant genes (ie false positives) was equal to the 10% of the total significant discoveries.
#BUT! Bc of the false positive-false negative trade-off, you need to decide if this is too many false positives for your large-scale RNA-seq experiment (where there could be a lot of genes)
#With a lower FDR threshold to lessen false positives, you lose some actually significant results that appear as negatives 

#Q3 
ggplot(data = res_sex, aes(x = log2FoldChange, y = -log10(padj), color = abs(log2FoldChange) > 1 & padj <= 0.1 )) +
  geom_point() +
  labs( title = "Volcano Plot")


