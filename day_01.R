4 * 4
(2 + 2) * 2
16 ^ 0.5 # you can skip 0 if number is > 0 and < 1
sqrt(16)
log(8)
?log
log(x = 8, base = 2)
log(8, 2)
`+`(10, 20) # operator is a function but don't overuse it

a <- 2
a = 2 #not really accepted

some_variable_name <- 10
a * a
sqrt(a)
b <- a - a ^ a + a

rm(some_variable_name)
b + a
a == b
a != b

# 5!=125

a > b
a < b
a >= b
a <= b
a >= a
b <= b

#5 + 3i

is.integer(a)
is.integer(2L)
typeof(a)
sin(pi)

#1.224647e-16 10 ^ -16 * 1.224647
200 ^ 30
#1.073742e+69 10 ^ 69 * 1.073742

options(scipen = 999)
sin(pi)
200 ^ 30

sqrt(2) ^ 2 == 2
#options(scipen = 7)

s <- "Hi everyone"
s
s1 <- 'Hi, everyone'
s1
class(s1)
paste("I", "love", "R")
paste("I", "love", "R", sep = "_<3_")
paste("I", "love", "R", sep = "")
paste0("I", "love", "R")

comparison <- a > b
t1 <- TRUE
f1 <- FALSE
!t1
!f1
#!!f1

t1 & t1 #t
t1 & f1 #f
f1 & t1 #f
f1 & f1 #f

f1 | f1 #f
f1 | t1 #t
t1 | f1 #t
t1 | t1 #t

c(4, 8, 15, 16, 23, 42)
c("Hey", "Ho", "Let's", "go")
paste("Hey", "Ho", "Let's", "go")
c(TRUE, FALSE, TRUE)
с(1, 3) #change to english

1:10
1.5:10
5:-3

seq(10, 100, by = 10)
seq(10, 100, 10)

rep(1, 5)
rep(1:3, 5)
rep(1:3, c(10, 2, 30))
rep(1:3, each = 10)

c(1:3, 50:60, 5:6)
v1 <- c("Hey", "Ho", "Let's", "go")
c(v1, "study", "R")

sum(1:100)
mean(1:100)
min(1:100)
max(1:100)

c(FALSE, 2)
c(2, "dva")
2 + TRUE
c(TRUE, 3, "hi", 576543)

as.character(as.numeric(c(TRUE, FALSE)))
as.character(c(TRUE, FALSE))
as.numeric(c("1", "2", "tri"))

n <- 1:4
m <- 4:1
n + m
n - m
n * m # %*% for linear algebra
n / m
n ^ m
n ^ m - n * (m + n)
sqrt(1:10)
log(1:10, base = 10:1)
sin(1:20)
sin(c(1:8, 10:20))
abs(-10:10)

sum(1:100)
-1 / 0

1 / 0.1
1 / 0.01
1 / 0.0000001
1 / 0.0000000001

-1 / 0
0 / 0
log(1:20)
k <- c(0, 10)
n + k
n * k
n ^ k
n * c(100, 1, 0)
n * 10

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
length(n)
n[length(n)]
n[6]
n[8]
n[3] <- 20
n
n[4:7]
n[10:1]
rev(n)
n
n[4:6] <- 0
n
n[-1]
n
n[-3:-6]
n[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)]
n[c(TRUE, FALSE)]

my_named_vector <- c(first = 1, second = 2, third = 3)
my_named_vector
my_named_vector["second"]
my_named_vector[c("second", "first")]
n[c(2, 5, 10)]
n[c(-1, 5)]

d <- 1:4
names(d)
letters
pi
0 + 1i
1i
exp(1)
LETTERS
month.name
month.abb

d
names(d) <- letters[1:4]
d
d[c("a", "c")]

n
n >= 18
n
n[n >= 18]
mean(n)
n[n >= mean(n)]
