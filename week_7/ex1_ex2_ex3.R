library(dplyr)
library(tidyr)
library(matrixStats)
setwd ("/Users/cmdb/qb25-answers/week_7/")


#Q1
gene_exp_matrix <- as.matrix(read.table("read_matrix.tsv"))

top500_gene_exp_matrix <- order(rowSds(gene_exp_matrix), decreasing=TRUE)[1:500]
transposed_matrix <- t(gene_exp_matrix[top500_gene_exp_matrix,])
pca_results <- prcomp(transposed_matrix)

pca_data <- tibble(PC1=pca_results$x[,1], PC2=pca_results$x[,2]) %>% 
  dplyr::mutate(tissue_replicates_combo = rownames(transposed_matrix)) 

separated_matrix <- pca_data %>% 
  tidyr::separate(col = tissue_replicates_combo, into = c("tissue", "replicate_number"), sep = "_")

ggplot(data = separated_matrix, aes(x = PC1, y = PC2, color = tissue, shape = replicate_number)) +
  geom_point() + 
  labs (
    title = "Wrong PCA Plot"
  )

separated_matrix[12,3] <- "Fe"
separated_matrix[13,3] <- "LFC.Fe" 
ggplot(data = separated_matrix, aes(x = PC1, y = PC2, color = tissue, shape = replicate_number)) +
  geom_point() + 
  labs (
    title = "Correct PCA Plot"
  )  

PC <- 1:21
stdev <- pca_results$sdev
stdev_plot <- data.frame(PC, stdev)

ggplot(data = stdev_plot, aes(x=PC, y=stdev)) + 
  geom_col(fill = "pink", color = "hotpink") +
  labs (
    title = "Variance Plot",
    y = "Amt Variance Explained by PC (%)"
  )

#Q2
gene_exp_matrix[, c(12,13)] <- gene_exp_matrix[, c(13,12)]

combined = gene_exp_matrix[,seq(1, 21, 3)]
combined = combined + gene_exp_matrix[,seq(2, 21, 3)]
combined = combined + gene_exp_matrix[,seq(3, 21, 3)]
combined = combined / 3
high_variance <- rowSds(combined) > 1
high_variance_data <- combined[high_variance,]

set.seed(42)
kmeans_results <- kmeans(as.matrix(high_variance_data), centers=12, nstart=100)
kmeans_clusters <- kmeans_results$cluster
ordered_k_means_clusters <- order(kmeans_clusters)
ready_for_dataset_order <- kmeans_clusters[ordered_k_means_clusters]
#order of the gene names by clusters 1-12, but does not sort the clusters themselves
#need to sort the clusters and dataset independently 
ordered_k_means_dataset <- high_variance_data[ordered_k_means_clusters,]

heatmap(ordered_k_means_dataset, Rowv=NA, Colv=NA, RowSideColors=RColorBrewer::brewer.pal(12,"Paired")[ready_for_dataset_order], ylab="Gene")


#Q3
cluster1_genes <- as.data.frame(ready_for_dataset_order) %>% filter(ready_for_dataset_order == "1") %>% rownames()
#to make the gene names good to copy and paste into Panther
cat(cluster1_genes, sep='\n')

cluster2_genes <- as.data.frame(ready_for_dataset_order) %>% filter(ready_for_dataset_order == "2") %>% rownames()
cat(cluster2_genes, sep='\n')
