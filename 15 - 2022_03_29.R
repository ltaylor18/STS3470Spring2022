#Tuesday, 3/29
#Notes 5-1B (last page)
#Notes 5-1C

#Notes 5-1B (last page)
#no additional code

#Notes 5-1C Walkthrough Code for Class

library(ggplot2)
library(dplyr)
library(gridExtra)
library(plotly)

#p.2
set.seed(2320)
mysample <- rnorm(20)
mysample
min(mysample)
max(mysample)
#p.3
#Manually creating graph
i <- 1:length(mysample)
n <- length(mysample)
f_i = (i - 0.375)/(n + 0.25)
theoretical <- qnorm(f_i)
qqplotdata <- data.frame(mysample=mysample)
qqplotdata <- arrange(qqplotdata,mysample)
qqplotdata <- mutate(qqplotdata,theoretical=theoretical)
ggplot(qqplotdata,aes(x=theoretical,y=mysample))+
  geom_point()+
  ylim(-2,2)
#p.4
#Calculate the line - find the 25th and 75th 
#percentile values for my sample
myq1 <- round(.25*n,0)
myq3 <- round(.75*n,0)
points <- qqplotdata[c(myq1,myq3),]
out <- lm(points$mysample ~ points$theoretical)
slope <- out$coefficients[2][[1]]
yint <- out$coefficients[1][[1]]

ggplot(qqplotdata,aes(x=theoretical,y=mysample))+
  geom_point()+
  ylim(-2,2)+
  geom_abline(slope=slope,intercept=yint)

#p.5
out <- lm(mtcars$mpg ~ mtcars$hp)
out
out$coefficients
out$coefficients[1]
out$coefficients[2]
out$coefficients[1][[1]]

#p.6
#Compare to the Standard Normal Distribution
ggplot(NULL,aes(sample=mysample)) +   
  stat_qq(distribution=stats::qnorm) +   
  geom_qq_line(distribution=stats::qnorm)

ggplot(NULL,aes(sample=mysample)) +   
  stat_qq(distribution=qnorm) +   
  geom_qq_line(distribution=qnorm)

#Compare to the t(3) distribution
ggplot(NULL,aes(sample=mysample)) + 
  stat_qq(distribution=stats::qt,
          dparams=list(df=3))+
  geom_qq_line(distribution=stats::qt,
               dparams=list(df=3)) 

#Side note:
#Do the points match??
ggplot(NULL,aes(sample=mysample)) +   
  stat_qq(distribution=stats::qnorm) +   
  geom_qq_line(distribution=stats::qnorm)+
  geom_point(aes(x=qqplotdata$theoretical,
                 y=qqplotdata$mysample),
             color="purple")

#p.7-8 Example
##YOUR WORK HERE##


#1
set.seed(2320)
x <- rnorm(10,100,5)
#2
ggplot(NULL,aes(x=x)) +
  geom_histogram(color="white",bins=5)

#4
ggplot(NULL,aes(sample=x))+
  stat_qq(distribution=qnorm)+
  stat_qq_line(distribution=qnorm)


#Continued next class