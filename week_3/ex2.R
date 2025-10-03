library(tidyverse)

setwd ("/Users/cmdb/qb25-answers/week_3/")
allele_frequency_df <- read_csv("AF.txt")
depths_df <- read_csv("DP.txt")

ggplot(data = allele_frequency_df, aes(x=allele_frequency)) +
  geom_histogram(bins = 11, position = "stack", fill = "magenta") +
    labs(
      x = "Variants",
      y = "Allele Frequency",
      title = "Allele Frequency Spectrum"
    ) 
  
                    
ggplot(data = depths_df, aes(x=depths)) +
  geom_histogram(bins = 21, position = "stack", fill = "plum") +
  labs(
    x = "Variants",
    y = "Depths",
    title = "Depths Histogram"
  ) + 
  xlim(0, 20) 
