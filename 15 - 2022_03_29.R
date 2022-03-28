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
  geom_point(aes(x=qqplotdata$theoretical,y=qqplotdata$mysample),color="purple")

#p.7-8 Example
##YOUR WORK HERE##




#p.9
#Generate 50000 samples with 15 observations each
mysamples <- replicate(50000,rnorm(15,12,0.1))

#Calculate summary statistics
mymeans <- apply(mysamples,2,mean)
mysds <- apply(mysamples,2,sd)

# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(15))

#p.10
set.seed(2320)
myobj <- rnorm(8000)
myobj2 <- myobj*myobj
mymat <- matrix(myobj2,nrow=1000)
mysums <- apply(mymat,1,sum)

myx <- seq(0.001,30,.05)
myy <- dchisq(myx,8)
ggplot(NULL, aes(x=mysums,y=..density..)) + 
  geom_histogram(color="white") + 
  geom_line(aes(x=myx,y=myy))

#1
ggplot(NULL,aes(sample=mysums)) + 
  stat_qq(distribution=stats::qchisq,dparams=list(df=8))+
  geom_qq_line(distribution=stats::qchisq,dparams=list(df=8))+
  labs(title="Chi-Squared, df=8")

#p.11
#for part d
fi <- (1000-0.375)/(1000+.25)
qchisq(fi,8)

#for part e
ggplot(NULL,aes(sample=mysums)) + 
  stat_qq(distribution=stats::qchisq,dparams=list(df=8),size=4)+
  geom_qq_line(distribution=stats::qchisq,dparams=list(df=8))+
  labs(title="Chi-Squared, df=8")+
  #geom_point(aes(y=max(mysums),x=qchisq(fi,8)),color="purple")
  geom_point(aes(y=max(mysums),x=27.868),color="red")

#2
ggplot(NULL,aes(sample=mysums)) + 
  stat_qq(distribution=stats::_____,dparams=______,size=4)+
  geom_qq_line(distribution=stats::_____,dparams=_______)+
  labs(title="Chi-Squared, df=1")

#3
ggplot(NULL,aes(sample=mysums)) + 
  stat_qq(distribution=stats::_____)+
  geom_qq_line(distribution=stats::_____)+
  labs(title="Normal")

