heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na.strings = c("-99", "-", "NA", ""))
?read.csv

mean(heroes$Height, na.rm = TRUE)

str(heroes)
# read.table("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
#            header = TRUE, sep = ",", dec = ".", quote = "",
#            stringsAsFactors = FALSE)


# Условные конструкции ----------------------------------------------------

n <- 1

n <- -2:2

# if (n > 0) {
#   "Positive number"
# } else if (n == 0) {
#   "Zero"
# } else {
#   "Negative number"
# }

ifelse(n > 0, "Positive number", "Negative number or zero")

ifelse(n > 0,
       "Positive number",
       ifelse(n == 0,
              "Zero",
              "Negative number"))

#library(dplyr)
#install.packages("dplyr")

dplyr::case_when(n > 0 ~ "Positive number",    #if
                 n == 0 ~ "Zero",              #else if
                 .default = "Negative number") #else

heroes$weight_group <-
  dplyr::case_when(is.na(heroes$Weight) ~ NA,
                   heroes$Weight > 200 ~ "very overweight",
                   heroes$Weight > 120 ~ "overweight",
                   heroes$Weight < 40 ~ "underweight",
                   .default = "normal weight")

pow <- function(x, p = 2) x ^ p
pow(10)
pow(10, 4)

w <- 80
h <- 1.65

imt <- function(weight, height) {
  if (weight <= 0 | height <= 0) return(NA)
  height_square <- height ^ 2
  weight/height_square
}

imt(45, 1.63)
imt(10, -10)


factors <- function(x) which(x %% 1:x == 0)
factors(2024)
is_prime <- function(x) length(factors(x)) == 2
is_prime(6)

is_prime <- function(x) all(x %% 2: (x - 1) != 0)
is_prime(2017)
is_prime(2024)

some_list <- list(letters = letters, numbers = 1:10)
lapply(some_list, length)
sapply(some_list, length)

library(tidyverse)
map(some_list, 2)
map_int(some_list, length)

A <- matrix(1:12, nrow = 3)
A
sum_of_squares <- function(x) sum((x - mean(x)) ^ 2)
apply(A, 1, sum_of_squares)

apply(A, 1, function(x) sum((x - mean(x)) ^ 2))

sqrt(1:10)
map_dbl(1:10, sqrt)

#is_prime(4:6)
map_lgl(3:40, is_prime)

#lapply(file_names, read.csv)
