library(tidyverse)
setwd ("/Users/cmdb/qb25-answers/week_4/")

#Q1
dnm_tibble <- read_csv("aau1043_dnm.csv")
parental_age_tibble <- read_csv("aau1043_parental_age.csv")

summarized_dnm_tibble <- dnm_tibble %>% group_by(Proband_id) %>% summarize(Father_counts = sum(Phase_combined == "father", na.rm = TRUE) , Mother_counts = sum(Phase_combined == "mother", na.rm = TRUE)) 
  
joined_tibble <- summarized_dnm_tibble %>% left_join(parental_age_tibble, by = "Proband_id")


#Q2
ggplot(data = joined_tibble, aes(x = Mother_age, y = Mother_counts, color = Proband_id)) +
  geom_point()+ 
  scale_color_gradient(low = "hotpink", high = "lightblue") +
  labs(
    x = "Maternal DNMs",
    y = "Maternal Age",
    title = "Maternal DNMs Plot" )
  
lr_maternal_DNMs <- lm(data = joined_tibble, formula = Mother_counts ~ 1 + Mother_age)
summary(lr_maternal_DNMs)

ggplot(data = joined_tibble, aes(x = Father_age, y = Father_counts, color = Proband_id)) +
  geom_point()+
  scale_color_gradient(low = "purple", high = "palegreen") +
  labs(
    x = "Paternal DNMs",
    y = "Paternal Age",
    title = "Paternal DNMs Plot" )

lr_paternal_DNMs <- lm(data = joined_tibble, formula = Father_counts ~ 1 + Father_age)
summary(lr_paternal_DNMs)


longer_joined_tibble <- joined_tibble %>% pivot_longer(cols = c(Mother_counts, Father_counts), names_to = "Parent_type", values_to = "DNMs")
                                                      
ggplot(data = longer_joined_tibble, aes(x = DNMs, fill = Parent_type)) +
  geom_histogram(alpha = 0.5, position = "identity") + 
  scale_fill_manual(values = c("hotpink", "plum")) +
  labs(
    x = "DNMs",
    y = "Frequency",
    title = "Overlaid Maternal + Paternal Histograms" )


t.test(x = joined_tibble$Mother_counts, y = joined_tibble$Father_counts, paired = TRUE)

comparison_joined_tibble <- joined_tibble %>% mutate(maternal_paternal_difference = Mother_counts - Father_counts) 
lr_DNMs_comparison <- lm(data = comparison_joined_tibble, formula = maternal_paternal_difference ~ 1)
summary(lr_DNMs_comparison)


#Q3
install.packages("tidytuesdayR")
library(tidytuesdayR)

tuesdata_2 <- tidytuesdayR::tt_load(2024, week = 30)
auditions <- tuesdata_2$auditions
ggplot(data = auditions, aes(x = audition_city, y = tickets_to_hollywood)) + 
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(
    x = "Audition City",
    y = "Tickets to Hollywood (#)",
    title = "Audition City vs Tickets to Hollywood across American Idol Seasons 1-18"
  )

# is there a difference in number of tickets to Hollywood across each season?
lr_american_idol <- lm(data = auditions, formula = tickets_to_hollywood ~ 1 + audition_city)
summary(lr_american_idol)

# p-value = 0.9931
# There is not a significant difference in number of tickets to hollywood across each season of American Idol (1-18).
# The number of tickets to hollywood each season of American Idol are usually similar quantities. 






# Valient attempt to do a more fun data set but I struggled too much and gave up.....

#tuesdata_1 <- tidytuesdayR::tt_load(2024, week = 23)
#cheeses <- tuesdata_1$cheeses

#ggplot(data = cheeses, aes(x = milk, y = fat_content)) + 
#geom_boxplot() +
#theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) 

#ggplot(data = cheeses, aes(x = milk, fill = type)) + 
#geom_histogram(bins = 10, position = "stack") +
#theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
#facet_grid(.~ family)
