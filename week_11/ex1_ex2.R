setwd ("/Users/cmdb/qb25-answers/week_11/")
library(tidyverse)

# 3x coverage
genome_coverage_3x <- read.delim("genome_coverage_3x.txt", header = FALSE)
normal_estimates_3x <- read.delim("normal_estimates_3x.txt", header = FALSE) %>% as.data.frame()
poisson_estimates_3x <- read.delim("poisson_estimates_3x.txt", header = FALSE) %>% as.data.frame()

normal_estimates_3x <- normal_estimates_3x %>% mutate(coverage = seq(0, n() -1))
poisson_estimates_3x <- poisson_estimates_3x %>% mutate(coverage = seq(0, n() -1))

ggplot(data = genome_coverage, aes(x= V1)) +
  geom_histogram(position = "stack", binwidth = 1) +
  geom_line(data = poisson_estimates_3x, aes(x = coverage, y = V1, color = "Poisson")) +
  geom_line(data = normal_estimates_3x, aes(x = coverage, y = V1, color = "Normal")) +
  scale_color_manual(values = c(Poisson = "magenta", Normal = "purple")) +
  labs(
    x = "Coverage",
    y = "Frequency",
    title = "3x Coverage"
  )
   

# 10x coverage
genome_coverage_10x <- read.delim("genome_coverage_10x.txt", header = FALSE)
normal_estimates_10x <- read.delim("normal_estimates_10x.txt", header = FALSE) %>% as.data.frame()
poisson_estimates_10x <- read.delim("poisson_estimates_10x.txt", header = FALSE) %>% as.data.frame()

normal_estimates_10x <- normal_estimates_10x %>% mutate(coverage = seq(0, n() -1))
poisson_estimates_10x <- poisson_estimates_10x %>% mutate(coverage = seq(0, n() -1))

ggplot(data = genome_coverage_10x, aes(x= V1)) +
  geom_histogram(position = "stack", binwidth = 1) +
  geom_line(data = poisson_estimates_10x, aes(x = coverage, y = V1, color = "Poisson")) +
  geom_line(data = normal_estimates_10x, aes(x = coverage, y = V1, color = "Normal")) +
  scale_color_manual(values = c(Poisson = "magenta", Normal = "purple")) +
  labs(
    x = "Coverage",
    y = "Frequency",
    title = "10x Coverage"
  )

# 30x coverage
genome_coverage_30x <- read.delim("genome_coverage_30x.txt", header = FALSE)
normal_estimates_30x <- read.delim("normal_estimates_30x.txt", header = FALSE) %>% as.data.frame()
poisson_estimates_30x <- read.delim("poisson_estimates_30x.txt", header = FALSE) %>% as.data.frame()

normal_estimates_30x <- normal_estimates_30x %>% mutate(coverage = seq(0, n() -1))
poisson_estimates_30x <- poisson_estimates_30x %>% mutate(coverage = seq(0, n() -1))

ggplot(data = genome_coverage_30x, aes(x= V1)) +
  geom_histogram(position = "stack", binwidth = 1) +
  geom_line(data = poisson_estimates_30x, aes(x = coverage, y = V1, color = "Poisson")) +
  geom_line(data = normal_estimates_30x, aes(x = coverage, y = V1, color = "Normal")) +
  scale_color_manual(values = c(Poisson = "magenta", Normal = "purple")) +
  labs(
    x = "Coverage",
    y = "Frequency",
    title = "30x Coverage"
  )
