#Thursday, February 3, 2022
#Notes 2

statement <- "Hello World"
height <- 72
mylogic <- TRUE
mylogic2 <- "TRUE"

length(statement)
length(height)
length(mylogic)
length(mylogic2)

is.character(statement)
is.character(height)
is.character(mylogic)
is.character(mylogic2)

is.logical(mylogic)
is.logical(mylogic2)

is.numeric(height)
is.integer(height) #surprising!

mylogic3 <- true #R does not like this!

#Example #1
a <- c(11,13,15,1,9,7,7,10)
b <- seq(5,10,1)

a[3]
a[1] <- 8
a

#part c
b[2]
a[3:6]
subset <- a[3:6]
subset

a[c(1,5,7)]

c(3:10)
3:10
seq(3,10)
seq(3,10,2)

a[-3]
x <- rep(4,10)
x

is.numeric(x)
is.character(x)
is.logical(x)
is.vector(x)

#Matrices
vec1 <- 1:4
vec2 <- 5:8

rbind(vec1,vec2)
mymatrix <- rbind(vec1,vec2)
dim(mymatrix)

cbind(vec1,vec2)

m <- matrix(nrow=2,ncol=3)
m

y <- matrix(1:12,nrow=3,ncol=4)
y

?matrix
y2 <- matrix(1:12,nrow=3,ncol=4,byrow=TRUE)
y2


cells <- c(1,26,24,68)
rnames <- c("R1","R2")
cnames <- c("C1","C2")
mymatrix <- matrix(cells,
                   nrow=2,
                   ncol=2,
                   byrow=TRUE,
                   dimnames=list(rnames,cnames))
mymatrix