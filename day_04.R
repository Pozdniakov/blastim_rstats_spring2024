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

left_join(band_members, band_instruments, by = "name")
band_members %>%
  left_join(band_instruments, by = "name")

band_instruments2

band_members %>%
  left_join(band_instruments2, by = c("name" = "artist"))

band_members %>%
  right_join(band_instruments)

band_members %>%
  full_join(band_instruments)

band_members %>%
  inner_join(band_instruments)

band_members %>%
  semi_join(band_instruments)

# band_members %>%
#   filter(name %in% band_instruments$name)

band_members %>%
  anti_join(band_instruments)

band_instruments %>%
  anti_join(band_members)
# band_instruments %>%
#   filter(!name %in% band_members$name)

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

powers_web <- powers %>%
  filter(`Web Creation`)

heroes %>%
  semi_join(powers_web, by = c("name" = "hero_names"))

heroes %>%
  anti_join(powers, by = c("name" = "hero_names")) %>%
  pull(name)

students <- tribble(
        ~student, ~before, ~after,
        "Antonina", 70, 63,
        "Vasya", 80, 79,
        "Petya", 91, 80)

students %>%
  pivot_longer(before:after,
               names_to = "time",
               values_to = "weight") %>%
  pivot_wider(names_from = time,
              values_from = weight)

# across() ----------------------------------------------------------------


heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(height_mean = mean(Height),
            weight_mean = mean(Weight))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight),
                   mean))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric),
                   mean))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric),
                   mean),
            across(where(is.character),
                   function(x) mean(nchar(x), na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric),
                   list(average = mean,
                        minimum = min,
                        maximum = max)))

iris %>%
  mutate(across(where(is.numeric), scale))

iris %>%
  mutate(across(where(is.numeric), function(x) (x / max(x)) * 100 ))


# nested columns ----------------------------------------------------------

heroes %>%
  nest(!Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest()

nested_heroes <- heroes %>%
  nest(!Gender)

films <- tibble(film = c("Звонок",
                         "Побег из Шоушенка",
                         "Начало",
                         "Зеленая миля"),
                genres = c("horror, fantasy",
                           "drama, triller",
                           "fantasy, action",
                           "drama, criminal, fantasy"))

films

str_split(films$genres, pattern = ", ")

films %>%
  mutate(genres = str_split(genres, ", ")) %>%
  unnest() %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres,
              values_from = value,
              values_fill = FALSE)
