#Thursday, 3/24
#Notes 5-1B 

pt(-2,9)
?pt #shades left because lower.tail=TRUE by default


#shade to right?
1-pt(-2,9)
pt(-2,9,lower.tail=FALSE)

library(ggplot2)

#Normal distribution
x <- seq(90,110,0.05)
y <- dnorm(x,100,3)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  labs(title="Normal Distribution",
       subtitle="Mean=100, SD=3")

#t(19) distribution
x <- seq(-4,4,0.05)
y <- dt(x,19)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  labs(title="t(19) Distribution")

###########################################################
#Side note - let's look at Standard Normal and t together!#
###########################################################
y2 <- dnorm(x)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  geom_line(aes(y=y2),
            color="red",
            linetype=2)+
  labs(title="t(19) -black and Z - red Distribution")



#What if the degrees of freedom get really big?
y <- dt(x,999)
ggplot(NULL,aes(x=x,y=y))+
  geom_line()+
  geom_line(aes(y=y2),
            color="red",
            linetype=2)+
  labs(title="t(999) -black and Z - red Distribution")


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



#Exercises p. 3-4
#1a.
pnorm(1.5,lower.tail=FALSE)
#or#
1-pnorm(1.5)

#1b.
pnorm(1.5,lower.tail=TRUE)+pnorm(1.5,lower.tail=FALSE)

#2a.
pt(1.5,3,lower.tail=FALSE)

#2b.
pt(1.5,29,lower.tail=FALSE)

#2c.
pt(1.5,99,lower.tail=FALSE)

#2d.
pt(2,3,lower.tail=FALSE)
pt(2,29,lower.tail=FALSE)
pt(2,99,lower.tail=FALSE)
pt(2,999,lower.tail=FALSE)
pnorm(2,lower.tail=FALSE)

#3
pchisq(10,3)-pchisq(5,3)
1-pchisq(5,3)-pchisq(10,3,lower.tail=FALSE)

#4
qnorm(.975)
qt(.975,9)


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


#Simulation, p.5-6
pnorm(2)-pnorm(1)
mynewnorm <- rnorm(10000,0,1)
sum(mynewnorm >= 1 & mynewnorm <= 2)/10000

mynewnorm <- rnorm(100000,0,1)
sum(mynewnorm >= 1 & mynewnorm <= 2)/100000

1-pnorm(1.96)
sum(mynewnorm >= 1.96)/100000

1+1
#Simulation, p.7
# Proof of t-distribution

# 1. Since we can't generate an infinite number of random samples,
# Let's settle for generating 50,000 samples of size 15 from a 
# Normal Distribution matching the population our soda sample
# came from (I'll use the mean=12 and sd=0.1),

mysamples <- replicate(50000,rnorm(15,12,0.1))

#Equivalent to writing rnorm(15,12,0.1) 50,000 times!

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

