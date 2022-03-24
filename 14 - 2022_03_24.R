#Thursday, 3/24
#Notes 5-1B 

library(ggplot2)

#Normal distribution
x <- seq(90,110,0.05)
y <- dnorm(x,100,3)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  labs(title="Normal Distribution",
       subtitle="Mean=100, SD=3")

#t(9) distribution
x <- seq(-4,4,0.05)
y <- dt(x,19)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  labs(title="t(9) Distribution")

###########################################################
#Side note - let's look at Standard Normal and t together!#
###########################################################
y2 <- __________
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  geom_line(aes(y=_____),
            color="red",
            linetype=2)+
  labs(title="t(9) -black and Z - red Distribution")

#F(3,19) distribution
x <- seq(0.0001,20,0.05)
y <- df(x,3,19)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  labs(title="F(3,19) Distribution")

#Chi-Squared(3) Distribution
x <- seq(0.0001,20,0.05)
y <- dchisq(x,3)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  labs(title="Chi-Squared(3) Distribution")

#p.5
myx <- seq(-3,3,.01)
myy <- dnorm(myx)

ggplot(NULL,aes(x=myx,y=myy)) +
  geom_line(color="red",size=2) +
  geom_segment(aes(x=1,xend=1,
                   y=0,yend=dnorm(1)),
               color="blue") +
  geom_segment(aes(x=2,xend=2,y=0,
                   yend=dnorm(2)),
               color="blue") +
  geom_text(aes(x=1.5,y=.05),
            label="Probability")




#Exercises p. 3-4
#1a.

#1b.

#2a.

#2b.

#2c.

#2f - repeat a-d

#3

#4



#p. 5
ggplot(NULL,aes(x=myx,y=myy)) +
  geom_line(color="red",size=2) +
  geom_segment(aes(x=1,xend=1,
                   y=0,yend=dnorm(1)),
               color="blue") +
  geom_segment(aes(x=2,xend=2,y=0,
                   yend=dnorm(2)),
               color="blue") +
  geom_text(aes(x=1.5,y=.05),
            label="Probability")

#Simulation, p.5-6
mynewnorm <- rnorm(10000,0,1)
sum(mynewnorm >= 1 & mynewnorm <= 2)/10000



#Simulation, p.7
# Proof of t-distribution

# 1. Since we can't generate an infinite number of random samples,
# Let's settle for generating 50,000 samples of size 15 from a 
# Normal Distribution matching the population our soda sample
# came from (I'll use the mean=12 and sd=0.1),

mysamples <- replicate(50000,rnorm(15,12,0.1))

# Each column of mysamples represents one replication of my
# soda experiment of observing 15 cans.

dim(mysamples)

# 2. Calculate the t-test statistic for each column of my data.
# Find the mean and standard deviation of each sample of 15 observations

mymeans <- apply(mysamples,2,mean)
mysds <- apply(mysamples,2,sd)

# Calculate t for each sample of 15 observations
myteststats <- (mymeans - 12)/(mysds/sqrt(15))



# 3. Observe the distribution of my calculated test statistics

library(ggplot2)
ggplot(NULL,aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white")

# 4. Super-impose the t-14 distribution on the histogram 
# of test statistics and generate a QQ-Plot to compare
# the test statistics to the Normal distribution.

myx <- seq(-4,4,.01)
myy <- dt(myx,14)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") +
  labs(title="50,000 t Test Statistics Compared to t-14 curve")

ggplot(NULL,aes(sample=myteststats)) +
  stat_qq() +
  geom_qq_line(distribution=stats::qnorm)

# 5. Until 1901, statisticians used the Normal Distribution
# to model the sampling distribution of this test statistic.
# How "bad" was that? Well, here' I've added the Normal
# Distribution's probability density function in blue. 
# What do you think?

myx <- seq(-4,4,.01)
myy <- dt(myx,14)
mynormy <- dnorm(myx)
ggplot(NULL, aes(x=myteststats)) +
  geom_histogram(aes(y=..density..), color="white") +
  geom_line(aes(x=myx,y=myy),color="red") + 
  geom_line(aes(x=myx,y=mynormy),color="blue",linetype=2)

# 6. What proportion of our simulated test statistics
# in the object myteststats are less than the value we
# calculated of -0.90? How does it compare to the theoretical
# p-value calculated above?

sum(myteststats <= -0.90)/50000

