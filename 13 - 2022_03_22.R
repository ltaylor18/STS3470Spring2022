#Tuesday, 3/22
#Notes 5-1A continued, Notes 5-1B 

library(ggplot2)
library(dplyr)

#Example, p.8
mysample <- rchisq(1000,8)
hist(mysample)

#Example, p.9
set.seed(2320)
mynorms <- rnorm(1000)

#1
mean(mynorms)
#2
sd(mynorms)
#3
?rnorm
#4
mynorms2 <- rnorm(5000,150,25)
ggplot(NULL,aes(x=mynorms2))+
  geom_histogram(color="white")

#What if we don't use ..density.. and 
#try to super-impose the probability 
#density function?
mymin <- min(mynorms2)
mymax <- max(mynorms2)
x <- seq(mymin,mymax,.05)
y <- dnorm(x,150,25)
ggplot(NULL,aes(x=mynorms2,y=..density..)) +
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y),
            size=2,
            color="red")
ggplot(NULL,aes(x=mynorms2)) +
  geom_histogram(color="white") +
  geom_line(aes(x=x,y=y),
            size=2,
            color="red")
#Why did this happen?
# The default histogram shows counts, which is 
# the wrong scale for density functions!

#Example, p.10
myobj <- rnorm(8000)
hist(myobj)
myobj2 <- myobj*myobj
mymat <- matrix(myobj2,nrow=1000)
?apply
dim(mymat)
mynewstat <- apply(mymat,1,sum)
length(mynewstat)
x <- seq(min(mynewstat),max(mynewstat),.01)
y <- dchisq(x,8)
ggplot(NULL,aes(x=mynewstat,y=..density..))+
  geom_histogram(color="white")+
  geom_line(aes(x=x,y=y),
            size=2,
            color="red")
#Example, p.11, #6
myobj <- rnorm(24000)
hist(myobj)
myobj2 <- myobj*myobj
mymat <- matrix(myobj2,nrow=3000)
dim(mymat)
mynewstat <- apply(mymat,1,sum)
length(mynewstat)
x <- seq(min(mynewstat),max(mynewstat),.01)
y <- dchisq(x,8)
ggplot(NULL,aes(x=mynewstat,y=..density..))+
  geom_histogram(color="white")+
  geom_line(aes(x=x,y=y),
            size=2,
            color="red")
#Example, p.11, #7
myobj <- rnorm(10000)
hist(myobj)
myobj2 <- myobj*myobj
mymat <- matrix(myobj2,nrow=2000)
dim(mymat)
mynewstat <- apply(mymat,1,sum)
length(mynewstat)
x <- seq(min(mynewstat),max(mynewstat),.01)
y <- dchisq(x,5)
ggplot(NULL,aes(x=mynewstat,y=..density..))+
  geom_histogram(color="white")+
  geom_line(aes(x=x,y=y),
            size=2,
            color="red")