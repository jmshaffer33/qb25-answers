library(tidyverse)

setwd ("/Users/cmdb/qb25-answers/week_3/")
total_sample_ancestry_df <- read_tsv("gt_long.txt")
chrII_A01_62_df <- read_tsv("gt_long.txt") %>% 
  filter(Sample_id == "A01_62" , Chrom == "chrII")
A01_62_df <- read_tsv("gt_long.txt") %>% 
  filter(Sample_id == "A01_62" )

ggplot(data = chrII_A01_62_df, aes(x=Pos, y=Sample_id, color = Genotype)) +
  geom_point() +
  labs(
    x = "Position",
    y = "Genotype",
    title = "Sample Ancestry for AO1_62 chrII"
  ) +
  scale_color_manual(values = c("hotpink", "plum"))

ggplot(data = A01_62_df, aes(x=Pos, y=Chrom, color = Genotype)) +
  geom_point() +
  labs(
    x = "Position",
    y = "Genotype",
    title = "Sample Ancestry for AO1_62"
  ) +
  facet_grid(. ~ Sample_id, space = "free_x", scales = "free_x") +
  scale_color_manual(values = c("hotpink", "plum"))

ggplot(data = total_sample_ancestry_df, aes(x=Pos, y=Chrom, color = Genotype)) +
  geom_point() +
  labs(
    x = "Position",
    y = "Genotype",
    title = "Total Sample Ancestry"
  ) +
  facet_grid(. ~ Sample_id, space = "free_x", scales = "free_x") +
  scale_color_manual(values = c("hotpink", "plum"))
