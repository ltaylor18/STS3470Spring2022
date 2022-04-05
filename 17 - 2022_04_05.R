#Tuesday, 4/5
#Notes 5-1D

library(dplyr)
library(ggplot2)

#Last class, p. 1
#3
mymeans <- replicate(10000,mean(rnorm(20,4,1)))

#4
mean(mymeans)
sd(mymeans)
1/sqrt(20)
ggplot(NULL,aes(x=mymeans))+
  geom_histogram(color="white")


.887/sqrt(20)


#Team 4
set.seed(2320)
mean(rchisq(20,5))
mymeans<-replicate(10000,mean(rchisq(20,5)))

mean(mymeans)

#Adding the Normal curve with mean=5
#and standard deviation of 3.162/sqrt(20)
#to the density histogram

myx <- seq(min(mymeans),max(mymeans),.01)
myy <- dnorm(myx,5,3.162/sqrt(20))
ggplot(NULL,aes(x=mymeans,y=..density..))+
  geom_histogram(color="white")+
  geom_line(aes(x=myx,y=myy))
