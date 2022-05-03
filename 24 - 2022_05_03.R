#Tuesday, 5/3
#Notes 6B & Notes 7

library(dplyr)
library(ggplot2)

########################
## Notes 6B Continued ##
########################

#Example 6
m <- NULL
mymat <- matrix(1:30,nrow=5,ncol=6,byrow=TRUE)
for(i in 1:length(mymat[1,])){
  m[i] <- mean(mymat[,i])
}

m <- NULL
mymat <- matrix(1:100,nrow=5,byrow=TRUE)
for(i in 1:length(mymat[1,])){
  m[i] <- mean(mymat[,i])
}


#Example 7
mysequence <- seq(100,2,-2)
for(i in mysequence){print(i/2)}

#Example, p.4 (first example about summing)
newsum <- 0
for(i in 1:10){
  newsum <- newsum + i*i
  print(newsum)
}

#Updating the sequence to 10, 20, 30,...,100
#How should you updated i*i to still calculate
#the same sum of squared values from 1 to 10
newsum <- 0
for(i in seq(10,100,10)){
  newsum <- newsum + (i/10)*(i/10)
  print(newsum)
}


#Example, p. 4
mymeans2 <- replicate(1000,mean(rnorm(3)))

mymeans3 <- 0 #or NULL
for(j in 1:1000){
  mymeans3[j] <- mean(rnorm(3))
}



#Notes 6 - Activity
#1.
set.seed(2320)

#2.
mydata <- rnorm(1000*30)
activitymat <- matrix(mydata,nrow=1000,ncol=30)

#3.
# True mean (mu) is 0, and true sd (sigma) is 1

#4.
out <- t.test(activitymat[1,],
              alternative="two.sided",
              mu=0) #do you really need the arguments?

out
mypvals <- out$p.value
mypvals

#6.
set.seed(2320)
mydata <- rnorm(1000*30)
activitymat <- matrix(mydata,nrow=1000,ncol=30)
out <- NULL
mypvals <- NULL

# What changes do we need to make to our
# original R expressions placed between the { } to complete
# this task. Note: There should be two changes 
# to the code below.
mypvals <- NULL
for(k in 1:1000){
  out <- t.test(activitymat[k,],
                alternative="two.sided",
                mu=0)
  
  mypvals[k] <- out$p.value
}

sum(mypvals <= 0.05)/1000 #About 5%!
sum(mypvals <= 0.10)/1000 #About 10%!


############
# Lesson 7 #
############

#Notes 7 Script

for(i in 1:5) {print(i)}

#Define the function
myprint <- function(num=5){
  for(i in 1:num){print(i)}
}

myprint()
myprint(num=2)
myprint(3)
out <- myprint(2)
out
args(myprint)
args(rnorm)
myprint

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
