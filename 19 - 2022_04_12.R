#Tuesday, 4/12
#Notes 5-2A and 5-2B

#Find my error!
#I spend WAY too long re-writing this code
#because I kept getting a weird error.
library(dplyr)
mycars <- mutate(mtcars,transmission=if_else(am==0,
                                             "automatic",
                                             "manual")) 
mycars <- select(mycars,transmission,hp)



##Picking up from last class:
set.seed(2320)
myvalues <- rnorm(30,100,10)

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

###########
#Example 3#
###########

set.seed(2320)
myvalues <- rnorm(30,100,10)
#What happens for different levels of confidence
loc <- c(0.90,0.95,0.99)
ci <- matrix(rep(NA,6),nrow=3,ncol=2)
out1 <- t.test(x=myvalues, 
               alternative="two.sided",
               mu=100,
               conf.level=loc[1])
out2 <- t.test(x=myvalues, 
               alternative="two.sided",
               mu=100,
               conf.level=loc[2])
out3 <- t.test(x=myvalues, 
               alternative="two.sided",
               mu=100,
               conf.level=loc[3])

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

