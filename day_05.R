library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA", ""))

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

sum(weight)/length(weight)
mean(weight)

median(weight)
median(c(1, 4, 5, 6, 9, 20))

mean(c(weight, 200000))
median(c(weight, 200000))
?quantile

heroes %>%
  count(`Eye color`, sort = TRUE)

?mean

mean(weight, trim = .5)

diff(range(weight))

sum((weight - mean(weight)) ^ 2)/(length(weight) - 1)

var(weight)

sqrt(sum((weight - mean(weight)) ^ 2)/(length(weight) - 1))
sd(weight)
sd(c(weight, 200000))
mad(weight)
IQR(weight)
IQR(c(weight, 200000))

#median(abs(weight - median(weight))) * 1.4826

#install.packages("psych")
library(psych)

skew(weight)
kurtosi(weight)
sort(weight)

summary(weight)

describe(weight)

heroes %>%
  group_by(Gender) %>%
  summarise(describe(Weight))

library(skimr)
skim(heroes)

#p0 - minimum
#p25 - Q1
#p50 - Q2 - median
#p75 - Q3
#p100 - maximum

xxx <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/d.csv")
xxx
skim(xxx)
skew(xxx$x)
skew(xxx$y)
describe(xxx)
IQR(xxx$x)
IQR(xxx$y)
cor(xxx$x, xxx$y)
plot(xxx)

plot(heroes$Height)
plot(heroes$Height, heroes$Weight)

plot(iris[,-5])

hist(weight, breaks = 100)

boxplot(heroes$Height ~ heroes$Gender)
boxplot(iris$Sepal.Length ~ iris$Species)
