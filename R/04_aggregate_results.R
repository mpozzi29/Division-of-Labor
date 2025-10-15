# Load dependencies
library(dplyr)
source("01_setup_conditions.R")

summ <- data.frame()
for (i in 1:nrow(ConditionsTable)){
  # Assumes the .csv files are in a subfolder named "data"
  dat <- read.csv(paste0("../data/Condition_", i, ".csv"))
  
  summ <- dat %>%
    group_by(Replicate) %>%
    summarize(Time = max(Time)) %>%
    mutate(NT = ConditionsTable$NT[i],
           NW = ConditionsTable$NW[i],
           Ratio = ConditionsTable$Ratio[i]) %>%
    bind_rows(summ)
  
  print(i / nrow(ConditionsTable))
}

save(summ, file = "aggregated_results.rda")
