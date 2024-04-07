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
