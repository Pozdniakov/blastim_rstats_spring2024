dnorm(0)
dnorm(1)
dnorm(-1)
vec <- seq(-5, 5, by = .01)
dnorm(vec)
plot(vec, dnorm(vec))

iq <- seq(50, 150, 0.1)
plot(iq, dnorm(iq,
               mean = 100,
               sd = 15))

pnorm(100, mean = 100, sd = 15)
1 - pnorm(130, mean = 100, sd = 15)
pnorm(0, mean = 100, sd = 15) *
  8000000000

rnorm(1, mean = 100, sd = 15)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp)

mean(samp)
sqrt(sum((samp - mean(samp))^2)/
       (length(samp) - 1))
sd(samp)

#CI95%

mean(rnorm(100, mean = 100, sd = 15))
hist(rlnorm(100), breaks = 30)
many_means <- replicate(1000000,
          mean(rlnorm(100)))
hist(many_means, breaks = 100)
mean(many_means)
sd(many_means)
15/sqrt(100)

sd(samp)/sqrt(length(samp))

samp
z_emp <- (mean(samp) - 100)/ (15/sqrt(length(samp)))
(1 - pnorm(z_emp)) * 2

psych::describe(samp)

t_emp <- (mean(samp) - 100)/ (sd(samp)/sqrt(length(samp)))
(1 - pt(t_emp, df = length(samp) - 1)) * 2
t.test(samp, mu = 100, alternative = "greater")
t.test(samp, mu = 100)

library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA", ""))

t.test(heroes$Weight, mu = 100)
t.test(heroes$Height, mu = 185)


diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet1 <- diet %>%
  filter(Diet == 1)

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

diet12 <- diet %>%
  filter(Diet %in% 1:2)

diet %>%
  count(Diet)

t.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE,
       var.equal = TRUE)

diet2 <- diet %>%
  filter(Diet == 2)

t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

diet23 <- diet %>%
  filter(Diet %in% 2:3)

t.test(diet23$weight6weeks ~ diet23$Diet, paired = FALSE)
shapiro.test(samp)
qqnorm(samp)
shapiro.test(diet1$weight6weeks)
qqnorm(diet1$weight6weeks)
qqnorm(rnorm(24))
hist(diet1$weight6weeks)
hist(rnorm(24))
hist(rnorm(10))

shapiro.test(diet$weight6weeks)
hist(rnorm(264))

tt <- t.test(rnorm(30), rnorm(30), var.equal = TRUE)
class(tt)
str(tt)
tt$p.value

t.test(rnorm(30), rnorm(30), var.equal = TRUE)$p.value
many_p <- replicate(100000,
                    t.test(rnorm(30),
                           rnorm(30),
                           var.equal = TRUE)$p.value)

mean(many_p < 0.05)
hist(many_p)

many_p_with_effect <- replicate(100000,
                    t.test(rnorm(30),
                           rnorm(30, mean = 0.5),
                           var.equal = TRUE)$p.value)
mean(many_p_with_effect < 0.05)
hist(many_p_with_effect[many_p_with_effect < 0.05], breaks = 100)

many_p_lognorm <- replicate(100000,
                                t.test(rlnorm(30),
                                       rlnorm(30),
                                       var.equal = TRUE)$p.value)

mean(many_p_lognorm < 0.05)
hist(many_p_lognorm)

t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

t.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE,
       var.equal = TRUE)
wilcox.test(diet12$weight6weeks ~ diet12$Diet,
       paired = FALSE)

t.test(c(90, 85, 87, 91), c(56, 50, 52, 59), paired = FALSE)
wilcox.test(c(90, 85, 87, 91), c(56, 50, 52, 59), paired = FALSE)

t.test(c(90, 85, 87, 91), c(56, 50, 52, 59), paired = TRUE)
wilcox.test(c(900, 850, 870, 910), c(56, 50, 52, 59), paired = TRUE)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA", ""))

gender_publisher <- heroes %>%
  drop_na(Gender) %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  select(Gender, Publisher)

table(gender_publisher$Gender)
table(gender_publisher)
f_ratio <- (61 + 111)/ (61 + 111 + 153 + 252)
(61 + 153) * f_ratio

class(table(gender_publisher))
summary(table(gender_publisher))
chisq.test(table(gender_publisher), correct = FALSE)
chisq.test(table(gender_publisher))
fisher.test(table(gender_publisher))

mosaicplot(table(gender_publisher),
           shade = TRUE,
           color = TRUE)

pub_good <- heroes %>%
  filter(Alignment %in% c("good", "bad")) %>%
  select(Alignment, Gender) %>%
  drop_na()

pub_good
table(pub_good)
fisher.test(table(pub_good))
chisq.test(table(pub_good))
mosaicplot(table(pub_good),
           shade = TRUE,
           color = TRUE)
