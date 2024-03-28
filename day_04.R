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

# Working with rows -------------------------------------------------------

heroes %>%
  slice(c(30, 100, 300))

#as_tibble(mtcars)

heroes %>%
  filter(Publisher == "DC Comics" & Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics", Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics") %>%
  filter(Gender == "Female")

heroes %>%
  filter(Weight < 40 | Weight > 400)

heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_min(Weight, n = 3)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice(1:3)

heroes %>%
  drop_na()

heroes %>%
  drop_na(Height)

heroes %>%
  drop_na(where(is.numeric))

# Sorting rows ------------------------------------------------------------

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(desc(Weight))

heroes %>%
  arrange(Gender)

heroes %>%
  arrange(Gender, Height)


# Creating new columns ----------------------------------------------------

heroes %>%
  mutate(imt = Weight / (Height/100) ^ 2) %>%
  select(name, imt) %>%
  arrange(imt)

heroes %>%
  transmute(name, imt = Weight / (Height/100) ^ 2)

heroes %>%
  mutate(id = row_number(), .before = name)

# Aggregation -------------------------------------------------------------

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            first = first(Weight),
            tenth = nth(Weight, n = 10),
            last = last(Weight))

heroes %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            first = first(Weight),
            tenth = nth(Weight, n = 10),
            last = last(Weight))

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE), .by = Gender)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight_by_gender = mean(Weight, na.rm = TRUE)) %>%
  ungroup() %>%
  mutate(weight_dev = Weight - mean_weight_by_gender, .after = Gender)

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender, Alignment, sort = TRUE)

heroes %>%
  count(Gender, Alignment, sort = TRUE) %>%
  mutate(prop = n / sum(n))

heroes %>%
  count(Weight > 200)

heroes %>%
  group_by(Race) %>%
  filter(n() >= 10)

heroes %>%
  group_by(Race) %>%
  filter(n() == 1)

# Advanced R --------------------------------------------------------------

ls()
file_names <- dir("data/many_tables",
    pattern = ".*csv",
    full.names = TRUE)

#read_csv(file_names)

list_of_df <- map(file_names, read_csv)

races <- file_names %>%
  str_remove("data/many_tables/heroes_") %>%
  str_remove(".csv")

names(list_of_df) <- races
list_of_df
bind_rows(list_of_df$Alien, list_of_df$Mutant, .id = "id")

bind_rows(list_of_df, .id = "id")

one_big_df <- map_dfr(file_names, read_csv)

band_members
band_instruments

left_join(band_members)
