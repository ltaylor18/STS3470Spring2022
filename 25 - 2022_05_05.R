#Thursday, 5/5
#Notes 7

library(dplyr)
library(ggplot2)

############
# Lesson 7 #
############


#######
#p. 2 #
#######

MyMean <-  function(X) { 
  S <- sum(X) 
  L <- length(X) 
  M <- S/L 
  m <- c("Mean is: ", M) 	#creates a character string   
  newS <- paste("Sum is: ", S)  #what does paste do?
  newL <- paste("Length is: ", L)
  print(newS) #What is the default output?
  print(newL, quote=FALSE) #What does quote=FALSE do?
  print(m, quote=FALSE) #Did we get the same output?  
  X  #what happens to whatever you list last?
}#end function

MyMean(trees$Volume)
#Or
MyMean(X=trees$Volume)

#5
out <- MyMean(X=trees$Volume)
out

#6
MyMean(mtcars$mpg)


#######
#p. 3 #
#######

xmax <- max(mtcars$mpg)
xmin <- min(mtcars$mpg)
S <- sum(mtcars$mpg) - xmax - xmin
L <- length(mtcars$mpg) - 2
M <- S/L
M

MyTrim <- function(datavar){
  xmax <- max(datavar)
  xmin <- min(datavar)
  S <- sum(datavar) - xmax - xmin
  L <- length(datavar) - 2
  M <- S/L
  M
}

#Will this work?
MyTrim()

MyTrim(trees$Volume)
MyTrim(mtcars$mpg)

#########################################
####Example on Type I Error and Power####
#########################################
#Code from Notes 6B:
set.seed(2320)
mydata <- rnorm(1000*30)
mydata.mat <- matrix(mydata,nrow=1000,ncol=30)
mypvals <- NULL
for(i in 1:1000){
  out <- t.test(mydata.mat[i,],alternative="two.sided",mu=0)
  mypvals[i] <- out$p.value
}
sum(mypvals <= 0.05)/1000

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



1+1
1+1













1+1





set.seed(2320)
Errors(0)


out <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0)
}
out

Errors(samples=5000,samplesize = 30,munull=1)


#Edited function!
Errors <- function(samples=1000,samplesize=30,munull=0,mutrue=0){
  mydata <- rnorm(samples*samplesize,mean=mutrue)
  mydata.mat <- matrix(mydata,nrow=samples,ncol=samplesize)
  mypvals <- NULL
  for(i in 1:samples){
    out <- t.test(mydata.mat[i,],alternative="two.sided",mu=munull)
    mypvals[i] <- out$p.value
  }
  sum(mypvals <= 0.05)/samples
  
}

Errors(5000,10,0,0.5)


#7
out <- NULL
myseq <- seq(10,50,10)
for(i in myseq){
  out[i/10] <- Errors(samples=5000,samplesize=i,munull=0,mutrue=0.5)
}
out


#8
differences <- seq(-1,1,.01)
out <- NULL
for(i in 1:length(differences)){
  out[i] <- Errors(samplesize = 20,munull=differences[i])
}
out

library(ggplot2)
ggplot(NULL,aes(x=differences,y=out))+
  geom_point()+
  geom_line()
