install.packages("Stat2Data")
library(Stat2Data)
library(tidyverse)

data("Backpack")
skimr::skim(Backpack)

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.453592,
         body_kg = BodyWeight * 0.453592)

back %>%
  select(backpack_kg, body_kg) %>%
  cov()

back %>%
  select(backpack_kg, body_kg) %>%
  var()

back %>%
  select(BackpackWeight, BodyWeight) %>%
  cov()

back %>%
  select(backpack_kg, body_kg) %>%
  cor()

cor.test(back$backpack_kg, back$body_kg)
cor.test(back$backpack_kg, back$body_kg, method = "spearman")
cor.test(back$backpack_kg, back$body_kg, method = "kendall")

plot(back$backpack_kg, back$body_kg)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA", ""))
cor.test(heroes$Height, heroes$Weight)
cor.test(heroes$Height, heroes$Weight, method = "spearman")
cor.test(heroes$Height, heroes$Weight, method = "kendall")
ggplot(heroes, aes(x = Height, y = Weight)) +
  geom_point()

heroes_under500 <- heroes %>%
  filter(Height < 500)

cor.test(heroes_under500$Height, heroes_under500$Weight)
cor.test(heroes_under500$Height, heroes_under500$Weight, method = "spearman")
cor.test(heroes_under500$Height, heroes_under500$Weight, method = "kendall")

cor.test(back$backpack_kg, back$BackProblems)
t.test(back$backpack_kg ~ back$BackProblems,
       var.equal = TRUE, paired = FALSE)

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  cor()

library(psych)

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test(adjust = "bonferroni")

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test()

matrix(rnorm(20 * 100), nrow = 100) %>%
  as.data.frame() %>%
  corr.test()

(20 * 20 - 20)/2 * 0.05

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test(adjust = "BH")

back %>%
  select(body_kg, backpack_kg, Units, Year) %>%
  corr.test(adjust = "fdr")

p.adjust(seq(0.0001, 0.06, length.out = 10), method = "BH")


# Hitmap корреляций -------------------------------------------------------

mtcars
install.packages("corrplot")
library(corrplot)

cor(mtcars)
mtcars_cor <- corr.test(mtcars, adjust = "none")
mtcars_cor$r
mtcars_cor$p

corrplot(mtcars_cor$r,
         method = "color",
         order = "hclust",
         p.mat = mtcars_cor$p)

install.packages("corrr")
library(corrr)
correlate(mtcars) %>%
  shave() %>%
  fashion()

correlate(mtcars) %>%
  network_plot(min_cor = 0.5)
?network_plot

model <- lm(backpack_kg ~ body_kg, data = back)
model$coefficients[2]

ggplot(back, aes(x = body_kg, y = backpack_kg)) +
  geom_point(alpha = .5) +
  geom_abline(intercept = model$coefficients[1],
              slope = model$coefficients[2])

predict(model, newdata = data.frame(body_kg = 100))
predict(model, newdata = data.frame(body_kg = 0))

class(model)
summary(model)

back$backpack_kg - model$fitted.values
residuals(model)
mean(residuals(model))

rss <- sum(residuals(model) ^ 2)
tss <- sum((back$backpack_kg - mean(back$backpack_kg)) ^ 2)
rss
tss
(tss - rss)/tss
summary(model)

cor.test(back$backpack_kg, back$body_kg)$estimate ^ 2
summary(model)

plot(model)

lm(backpack_kg ~ BackProblems, data = back) %>%
  summary()

t.test(backpack_kg ~ BackProblems, data = back, var.equal = TRUE)

model_mult <- lm(backpack_kg ~ body_kg + Units, data = back)
summary(model_mult)
summary(model)
model_mult2 <- lm(backpack_kg ~ body_kg + Units + BackProblems, data = back)
summary(model_mult2)

library(car)
vif(model_mult2)


diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv") %>%
  mutate(weight.loss = weight6weeks - pre.weight,
         Dietf = factor(Diet, labels = LETTERS[1:3])) %>%
  drop_na()

aov_model <- aov(weight.loss ~ Dietf, data = diet)
aov_model
summary(aov_model)
plot(aov_model)
lm_diet_model <- lm(weight.loss ~ Dietf, data = diet)
summary(lm_diet_model)

install.packages("ez")
library(ez)
ez_aov <- ezANOVA(data = diet,
        dv = weight.loss,
        between = Dietf,
        wid = Person,
        detailed = TRUE,
        return_aov = TRUE)
ez_aov$aov

diet %>%
  pivot_longer(cols = c(pre.weight, weight6weeks),
               names_to = "time", values_to = "weight") %>%
  ezANOVA(dv = weight,
          wid = Person,
          within = time)

# 2-way ANOVA: 2x3 ANOVA
ezANOVA(data = diet,
        dv = weight.loss,
        wid = Person,
        between = .(gender, Dietf) )

pairwise.t.test(diet$weight.loss,
                diet$Dietf,
                paired = FALSE,
                p.adjust.method = "bonferroni",
                pool.sd = FALSE)

TukeyHSD(aov_model)

mtcars
#2x2 ANOVA
aov(mpg ~ vs * am, data = mtcars) %>% summary()

ezANOVA(data = mtcars %>% mutate(name = row.names(.)),
        dv = mpg,
        wid = name,
        between = .(vs, am))
