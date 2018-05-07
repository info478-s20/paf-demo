# Calculate PAFs
library(dplyr)

# Load .csv data
data <- read.csv("data/relative-risks.csv", stringsAsFactors = F)

# Compute PAFs
data <- data %>% 
  mutate(prev = percent.prevalence / 100) %>% 
  mutate(paf = (prev * (relative.risk- 1)) / (prev * (relative.risk- 1) + 1))

# Compute attributable deaths
data <- data %>% 
  mutate(attributable_deaths = paf * total.deaths)