library(data.table)
heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
      na.strings = c("-99", "-", "NA", ""))
heroes_dt
class(heroes_dt)
#print(heroes_dt)
heroes_dt
heroes_dt[Alignment == "good",
          .(height_mean = mean(Height, na.rm = TRUE)),
          by = Gender][order(-height_mean),]

library(tidyverse)
heroes_tbl <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
         na = c("-99", "-", "NA", ""))
class(heroes_tbl)
heroes_tbl

heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(mean_height = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(mean_height))

#filter(heroes_tbl, Alignment == "good")

sum(log(abs(sin(1:10))))
1:10 %>%
  sin() %>%
  abs() %>%
  log(10, base = .) %>%
  sum()

1:10 |>
  sin() |>
  abs() |>
  log(10, base = _) |>
  sum()

heroes_tbl
heroes <- heroes_tbl

heroes %>%
  select(1, 5)

heroes_some_columns <- heroes %>%
  select(name, Race, Publisher, `Hair color`)

heroes_some_columns

heroes %>%
  select(name:`Eye color`, Publisher:Weight)

heroes %>%
  select(!...1)
heroes %>%
  select(!(Gender:Height))
heroes %>%
  select(name:last_col())

heroes %>%
  select(everything())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("H") & ends_with("color"))

heroes %>%
  select(contains("eigh"))

heroes %>%
  select(matches("."))
heroes %>%
  select(where(is.numeric))

heroes %>%
  select(where(function(x) !any(is.na(x)) ))

heroes %>%
  select(is.numeric)

heroes %>%
  select(id = ...1, Universe = Publisher)

heroes %>%
  rename(id = ...1, Universe = Publisher)

make.names(c("eye color", "2345"))

heroes %>%
  rename_with(make.names)

toupper(c("eye color", "2345"))
tolower(c("eye color", "2345"))

heroes %>%
  rename_with(toupper)

heroes %>%
  relocate(Publisher)
heroes %>%
  relocate(Publisher, .after = name)
heroes %>%
  relocate(Publisher, .before = name)

heroes %>%
  relocate(Publisher, where(is.numeric), .after = name)

heroes %>%
  select(Height)

mtcars[, 1, drop = FALSE]

heroes %>%
  select(Height) %>%
  pull()

heroes %>%
  pull(Height)

heroes %>%
  pull(Height, name)
