#Thursday, 4/7
#Notes 5-1D continued (hypothesis testing)
#Notes 5-2A

library(dplyr)
library(ggplot2)


#Dr. Taylor's secret:
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#I'm Team Edward...
#Oops, not that secret...
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#My favorite member of BTS is Jimin...
#Not that secret either...
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#There is an automated way to draw density functions in ggplot...


norm <- data.frame(value = rnorm(1000, 500, 10))

ggplot(norm, aes(x = value)) + 
  geom_histogram(aes(y=..density..),color = "white") + 
  stat_function(fun = dnorm,args=list(mean=500,
                                      sd=10),
                size=2)

################Hypothesis Testing Example############################

sleep_depriv <- c(-14.7, -10.7, -10.7, 2.2, 2.4, 4.5, 7.2, 9.6, 10.0, 21.3, 21.8)
sleep_NOTdepriv <- c(-7.0, 11.6, 12.1, 12.6, 14.5, 18.6, 25.2, 30.5, 34.5, 45.6)
performance=c(sleep_depriv,sleep_NOTdepriv)
status=c(rep("deprived",11),rep("NOT deprived",10))

sleepdata <- data.frame(status,
                        performance)
library(ggplot2)
ggplot(sleepdata,aes(x=status,y=performance))+
  geom_boxplot()+coord_flip()

out <- t.test(sleepdata$performance ~ sleepdata$status,
              alternative="less",
              var.equal=TRUE)
out
myteststat <- out$statistic
out$p.value

#2 - Verify
pt(-2.71,19)

#Randomize the data one time
newperformance <- sample(performance,21,replace=FALSE)
newsleepdata <- data.frame(status=c(rep("deprived",11),rep("NOT deprived",10)),
                           newperformance)
out <- t.test(newperformance ~   status,
              alternative="less",
              var.equal=TRUE)

#Randomize the data 10,000 times
myt <- replicate(10000,t.test(sample(performance,21,replace=FALSE) ~   status,
                              alternative="less",
                              var.equal=TRUE)$statistic)

x <- seq(-4,4,.01) #alternative: x <- seq(min(myt),max(myt),.001)
y <- dt(x,19)
ggplot(NULL,aes(x=myt,y=..density..))+
  geom_histogram(color="white")+
  geom_line(aes(x=x,y=y))

#4 
sum(myt <= myteststat)/10000
pt(-2.71,19)

myt <- replicate(50000,t.test(sample(performance,21,replace=FALSE) ~   status,
                              alternative="less",
                              var.equal=TRUE)$statistic)
sum(myt <= myteststat)/50000

########################
#######Notes 5-2A#######
########################

set.seed(2320)
set.seed(10) #This doesn't have 100 in it!
myvalues <- rnorm(30,100,10)
t.test(x=myvalues,
       alternative="two.sided",
       mu=100,
       conf.level=0.95)

(mean(myvalues)-100)/(sd(myvalues)/sqrt(30))

#5
?t.test

#6
t.test(x=myvalues,
       alternative="less",
       mu=105,
       conf.level=0.95)

#7
out <- t.test(x=myvalues,
              alternative="less",
              mu=105,
              conf.level=0.95)
out$statistic
out$p.value
out$conf.int
out$conf.int[1:2]
###########
#Example 2#
###########

?if_else

#Simulate generating 30 observations from the Normal distribution and using t.test to calculate the lower bound and upper bound of the confidence interval
mysim <- replicate(1000,t.test(rnorm(30,100,10),
                               alternative="two.sided",
                               mu=100,
                               conf.level=0.95)$conf.int[1:2])
mysim[,1:10]
#Store the lower bounds in the object lower and upper bounds in the object upper
lower <- mysim[1,]
upper <- mysim[2,]

#Create an indicator for if the true value of mu is in the interval
library(dplyr)
indicator <- if_else(lower <= 100 & upper >= 100, 1, 0)
indicator[1:10]
#How many intervals correctly captured the value of mu?
sum(indicator)
sum(indicator)/1000

#ENDING PLACE ON THURSDAY 4/7/2022

###########
#Example 3#
###########
#What happens for different levels of confidence
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,6),nrow=3,ncol=2)
out1 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[1])
out2 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[2])
out3 <- t.test(x=myvalues, alternative="two.sided",mu=100,conf.level=loc[3])

ci[1,] <- out1$conf.int[1:2]
ci[2,] <- out2$conf.int[1:2]
ci[3,] <- out3$conf.int[1:2]

#How wide are the intervals?
diff <- ci[,2] - ci[,1]
diff

#Where are they centered?
apply(ci,1,mean)
mean(myvalues)

###########
#Example 4#
###########
#######################################
#What happens if we change sample size?
#######################################
set.seed(2320)
myvalues10 <- rnorm(10,100,1)
myvalues30 <- rnorm(30,100,1)
myvalues100 <- rnorm(100,100,1)
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,6),nrow=3,ncol=2)
out1 <- t.test(x=myvalues10, alternative="two.sided",mu=100,conf.level=loc[1])
out2 <- t.test(x=myvalues30, alternative="two.sided",mu=100,conf.level=loc[1])
out3 <- t.test(x=myvalues100, alternative="two.sided",mu=100,conf.level=loc[1])

ci[1,] <- out1$conf.int[1:2]
ci[2,] <- out2$conf.int[1:2]
ci[3,] <- out3$conf.int[1:2]

#How wide are the intervals?
diff <- ci[,2] - ci[,1]
diff

#Where are they centered?
apply(ci,1,mean)
mean(myvalues10)
mean(myvalues30)
mean(myvalues100)

###########
#Example 5#
###########
library(ggplot2)
library(dplyr)
library(RColorBrewer)
mysim <- replicate(100,t.test(rnorm(30,100,10),
                              alternative="two.sided",
                              mu=100,
                              conf.level=0.95)$conf.int[1:2])
lower <- mysim[1,]
upper <- mysim[2,]
indicator <- if_else(lower <= 100 & upper >= 100, 1, 0)
nsim <- length(lower)
mydata <- data.frame(row=1:length(mysim[1,]),
                     point.estimate=apply(mysim,2,mean),
                     lower.bound=lower,
                     upper.bound=upper,
                     check=indicator)
g <- ggplot(mydata,aes(x=row,
                       y=point.estimate,
                       ymin=lower.bound,
                       ymax=upper.bound,
                       color=factor(check))) +  
  geom_pointrange() + 
  coord_flip() +
  geom_hline(yintercept=100) +
  labs(title=paste("Simulation of",loc*100,"% confidence"),
       subtitle=paste("Captured:",sum(indicator),"out of",nsim, "simulations"),
       x="",
       y="Confidence Intervals")+
  scale_color_brewer(palette="Dark2")   
plot(g)

