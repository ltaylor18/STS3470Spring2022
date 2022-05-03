#Notes 7 Script

for(i in 1:5) {print(i)}

#Define the function
myprint <- function(num=5){
  for(i in 1:num){print(i)}
}

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

#######
#p. 3 #
#######

xmax <- max(mtcars$mpg)
xmin <- min(mtcars$mpg)
S <- sum(mtcars$mpg) - xmax - xmin
L <- length(mtcars$mpg) - 2
M <- S/L
M


________ <- function(________){
  xmax <- max(datavar)
  xmin <- ________
    S <- ________
    L <- ________
    M <- ________
    M
}


#Example
set.seed(2320)
mydata <- rnorm(1000*30)
mydata.mat <- matrix(mydata,nrow=1000,ncol=30)
mypvals <- NULL
for(i in 1:1000){
  out <- t.test(mydata.mat[i,],alternative="two.sided",mu=0)
  mypvals[i] <- out$p.value
}

sum(mypvals <= 0.05)/1000


#######
#p. 4 #
#######

#3
out <- NULL
myseq <- seq(___,____,___)
for(i in myseq){
  out[___] <- Errors(samples=5000,samplesize=____,munull=0)
}
out


  
#7
out <- NULL
myseq <- seq(___,____,___)
for(i in myseq){
  out[_______] <- Errors(samples=5000,samplesize=____,munull=0,mutrue=___)
}
out

#######
#p. 6 #
#######

MyTrim <- function(datavar)		
{
  xmax <- max(datavar)
  print(xmax)
  xmin <- min(datavar)
  print(xmin)
  S <- sum(datavar) - xmax - xmin
  print(S)
  L <- length(datavar) - 2
  print(L)
  M <- S/L
  print(M)
  print("Laura Taylor")
  return(M)
}#end function
