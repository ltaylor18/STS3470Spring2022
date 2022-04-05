#Thursday, 4/7
#Notes 5-1D continued (hypothesis testing)

library(dplyr)
library(ggplot2)

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

#Randomize the data one time
newperformance <- sample(performance,21,replace=TRUE)
newsleepdata <- data.frame(status=c(rep("deprived",11),rep("NOT deprived",10)),
                           newperformance)
out <- t.test(newperformance ~   status,
              alternative="less",
              var.equal=TRUE)

#Randomize the data 10,000 times
myt <- replicate(10000,t.test(sample(performance,21,replace=TRUE) ~   status,
                              alternative="less",
                              var.equal=TRUE)$statistic)

x <- seq(-4,4,.01)
y <- dt(x,19)
ggplot(NULL,aes(x=myt,y=..density..))+
  geom_histogram(color="white")+
  geom_line(aes(x=x,y=y))