library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-99", "-", "NA", ""))

heroes_good <- heroes %>%
  mutate(good = Alignment == "good", .after = name) %>%
  drop_na(Weight, Gender, good)

heroes_good_glm <- glm(good ~ Weight + Gender, heroes_good, family = binomial())
summary(heroes_good_glm)

heroes_good_glm_noweight <- glm(good ~ Gender, heroes_good,
                                family = binomial())
summary(heroes_good_glm_noweight)

install.packages("lme4")
library(lme4)
data("sleepstudy")
?sleepstudy

sleepstudy %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()
library(lmerTest)
sleep_lme0 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
sleep_lme1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
sleepstudy$predicted_by_sleep_lme0 <- predict(sleep_lme0)
sleepstudy$predicted_by_sleep_lme1 <- predict(sleep_lme1)

sleepstudy %>%
  rename(observed_RT = Reaction) %>%
  pivot_longer(cols = c(observed_RT,
                        predicted_by_sleep_lme0,
                        predicted_by_sleep_lme1),
               names_to = "model",
               values_to = "Reaction") %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line(aes(colour = model)) +
  geom_point(data = sleepstudy) +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

anova(sleep_lme0, sleep_lme1)

summary(sleep_lme1)

library(emmeans)
emmeans(sleep_lme1, list(pairwise ~ Days), adjust = "tukey")

library(report)
report(sleep_lme1)
