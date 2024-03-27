
vec5 <- 1:20
vec5[(seq(2, 20, by = 2))] #a

seq(2, 20, by = 2) #b + +

1:10 * 2 #c ++++ +

(1:20)[(1:20) %% 2 == 0] #d +

(1:20)[c(FALSE, TRUE)] #e +

seq(1, 10) * 2 #f

seq(1, 20)[c(seq(2, 20, by = 2))] #g

aa <- (1:20) * c(0, 1)
aa[aa != 0] #i +

v <- c(2, 4, 6, 8, 10, 12, 16, 18, 20) #j +
miss <- which(diff(v) != 2)
c(v[1:miss], 14, v[(miss+1) : length(v)] )

v <- 1:10 * 2
v[v != 14]

eyes <- c("green", "blue", "blue", "brown", "green", "blue")
eyes
sum(eyes == "blue")
#sum(eyes == "blue")/length(eyes == "blue")
mean(eyes == "blue")
paste0(mean(eyes == "blue") * 100, "%")

all(eyes == "blue")
any(eyes == "blue")

which(eyes == "blue")

eyes[eyes == "blue"]
eyes[eyes == "blue" | eyes == "green"]

eyes[eyes == c("green", "blue")]

eyes %in% c("green", "blue")

respondents_from <- c("Москва", "Санкт-Петербург", "Москва", "Париж", "Екатеринбург", "Екатеринбург",
  "Казань", "Мурманск", "Тбилиси", "Новосибирск", "Балашиха", "Васюки", "Ухтар")

city_millions <- c("Москва", "Санкт-Петербург", "Казань", "Екатеринбург", "Воронеж", "Новосибирск")

respondents_from %in% city_millions
respondents_from[respondents_from %in% city_millions]

missed <- NA
NA == 0
NA == ""
NA == NULL
NA == "NA"
NA == NA

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[6] <- NA
n
is.na(n)
mean(n)
n == NA
5 == NA
NA == NA
Vova <- NA
Katya <- NA
Vova == Katya
mean(n[!is.na(n)])

?mean
mean(n, na.rm = TRUE)

typeof(NA)
as.character(c(1, 2, NA))

NA ^ 0
NA & FALSE

1 / 0
0 / 0
is.nan(NaN)
is.na(NaN)
is.nan(NA)

A <- matrix(1:20, nrow = 5)
A
A[2, 3]
B <- A[2:4, 1:3]
B[2, 2]

A[c(1, 3, 5),]
A[, 1:2]
A[, 1]
A[2:3, 2:3] <- 100
A
attributes(A)
attr(A, "dim") <- NULL
A
attr(A, "dim") <- c(10, 2)
A
A[2:10]
attr(A, "dim") <- c(4, 5)
A
attr(A, "dim") <- c(5, 2, 2)
A
A[2, 2, 2]

B <- matrix(1:20, nrow = 4)
B[2:3, 1:4]

matrix(1:30, nrow = 5, byrow = TRUE)
matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
outer(1:9, 1:9)
1:9 %o% 1:9

simple_list <- list(42, "hi", TRUE)
complex_list <- list(1:10, letters, simple_list, A, mean)
complex_list
str(complex_list)

named_list <- list(name = "Veronica", age = 26, student = TRUE)
named_list
named_list$name
named_list["name"]
named_list[["name"]]
named_list[1]
named_list[[1]]
class(complex_list[4])
class(complex_list[[4]])
complex_list[[4]][2,2,2]
?t
C <- matrix(1:12, nrow = 3)
C
t(C)

people_list <- list(name = c("Жора", "Зухра", "Антон", "Тидей", "Света"),
     age = c(15, 65, 42, 32, 19),
     student = c(TRUE, TRUE, FALSE, FALSE, TRUE))
people_list
str(people_list)

# Dataframes --------------------------------------------------------------

df <- data.frame(name = c("Жора", "Зухра", "Антон", "Тидей", "Света"),
                 age = c(15, 65, 42, 32, 19),
                 student = c(TRUE, TRUE, FALSE, FALSE, TRUE))
str(df)
df
df[4, 1]
df[c(2,4), "age"]

View(df)
df$name
df[df$age > mean(df$age), "name"]
df$name[df$student]
df$lovesR <- TRUE
df

# Packages ----------------------------------------------------------------

# install.packages("beepr")
library(beepr)

beep()
beepr::beep(5) #:::

?beep
install.packages("BiocManager")
BiocManager::available()
BiocManager::install("flowCore")

install.packages("remotes")
remotes::install_github("brooke-watson/BRRR")
BRRR::skrrrahh(22)


need_packages <- c("remotes", "BiocManager", "tidyverse",
                   "psych", "skimr")
#install.packages(need_packages)
#install.packages("tidyverse")
library(BRRR)
skrrrahh(sound = 26)
skrrrahh()
skrrrahh(0)
skrrrahh("snoop")
skrrrahh(41)

# Import data -------------------------------------------------------------

read.csv("/Users/ivan/Library/Mobile Documents/com~apple~CloudDocs/Downloads/heroes_information.csv")
heroes_information <- read.csv("~/R/tidy_stats_test/data/heroes_information.csv")
heroes <- read.csv("~/Library/Mobile Documents/com~apple~CloudDocs/Downloads/heroes_information.csv")
getwd()
read.csv("heroes_information.csv")
#setwd()

read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv")
