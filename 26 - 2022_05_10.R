#Tuesday, 5/10
#Notes 7 - Continued

library(dplyr)
library(ggplot2)

#########################################
####Example on Type I Error and Power####
#########################################

#1
Errors <- function(samples=1000,
                   samplesize=30,
                   munull=0){
  mydata <- rnorm(samples*samplesize)
  mydata.mat <- matrix(mydata,
                       nrow=samples,
                       ncol=samplesize)
  mypvals <- NULL
  for(i in 1:samples){
    out <- t.test(mydata.mat[i,],
                  alternative="two.sided",
                  mu=munull)
    mypvals[i] <- out$p.value
  }
  sum(mypvals <= 0.05)/samples
  
}

set.seed(2320)
Errors()
Errors(samples=5000)
Errors(samples=5000,samplesize=10)
Errors(samples=5000,samplesize=100)

#3
out <- NULL
out2 <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0)
  out2[i] <- Errors(samples=5000,samplesize=i,munull=0)
  }
out
out2

#4
Errors(5000,20,1)

#############5/10/2022############

#5
#Edited function!
Errors <- function(samples=1000,
                   samplesize=30,
                   munull=0,
                   mutrue=0){
  
  #replicate(samples,rnorm(samplesize,mutrue)) #Alternatively!
  mydata <- rnorm(samples*samplesize,mean=mutrue) #UPDATE!!
  mydata.mat <- matrix(mydata,nrow=samples,ncol=samplesize)
  mypvals <- NULL
  for(i in 1:samples){
    out <- t.test(mydata.mat[i,],alternative="two.sided",mu=munull)
    mypvals[i] <- out$p.value
  }
  sum(mypvals <= 0.05)/samples
  
}

#6
Errors(5000,10,0,0.5)
#What if the difference was bigger?
Errors(5000,10,0,2)
#What if we use a larger sample?
Errors(5000,30,0,0.5)
Errors(5000,50,0,0.5)

#7
out <- NULL
out2 <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0,mutrue=0.5)
  out2[i] <- Errors(samples=5000,samplesize=i,munull=0,mutrue=0.5)
}
out
rbind(myseq,out)

out2 #has a bunch of missing values!

#8
differences <- seq(-1,1,.01)
out <- NULL
for(i in 1:length(differences)){
  out[i] <- Errors(samplesize = 20,munull=differences[i])
}
out

#BONUS!!
library(ggplot2)
ggplot(NULL,aes(x=differences,y=out))+
  geom_point()+
  geom_line()


#Example of list
out <- t.test(rnorm(10))
is.list(out)
out$estimate

#Functions that return objects example
MyTrim <- function(datavar){
  xmax <- max(datavar)
  xmin <- min(datavar)
  S <- sum(datavar) - xmax - xmin
  L <- length(datavar) - 2
  M <- S/L
  M
  output <- list(xmax=xmax,
                 xmin=xmin,
                 S=S,
                 L=L,
                 M=M)
  return(output)
}

myout <- MyTrim(mtcars$mpg)
myout
myout$M


