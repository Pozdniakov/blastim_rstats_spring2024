library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA", ""))

dir.create("data")
dir.create("data/many_tables")
heroes %>%
  mutate(Race = make.names(Race)) %>%
  split(.$Race) %>%
  iwalk(function(x, idx) write_csv(x,
                                   paste0("data/many_tables/heroes_", idx)))

