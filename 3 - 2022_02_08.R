#Tuesday, February 8, 2022
#Notes 2 Continued

#We need these objects from last time:
cells <- c(1,26,24,68)
rnames <- c("R1","R2")
cnames <- c("C1","C2")
mymatrix <- matrix(cells,
                   nrow=2,
                   ncol=2,
                   byrow=TRUE,
                   dimnames=list(rnames,cnames))

#a
mymatrix <- matrix(cells,nrow=2,ncol=2,byrow=FALSE)
#b
dim(mymatrix)
#c
y <- matrix(1:10,ncol=2)
y
#d
w <- matrix(1:10,nrow=2)
w

#e-#h
w[2,4]
y[,2]
y[2,]
w[1,c(4,5)]


#i
z <- matrix(rep(10,9),3,3)
z
#does this work?
z2 <- matrix(10,3,3)
z2
z3 <- matrix(1:2,3,3)
z3
#h Class solution
q <- matrix(10:18, nrow=3)
q


#h Dr. T's solution
q <- matrix(10:18,nrow=3)
q

#i
y[2:3,]

#j
c(y[2,2],y[3,2],y[5,2])

#Answering a question!
7 == y

#Data frames
ChickWeight
?ChickWeight
summary(ChickWeight)

#Sleep example!
str(sleep)
data(sleep)
View(sleep)
?sleep

summary(sleep)
extra #doesn't work the first time we tried it
sleep$extra
sleep$ID

attach(sleep)
extra

sleep$extra[sleep$ID==1] # note the double equals ==
extra[group==1]

summary(extra[group==1])

extra1 <- sleep$extra[sleep$group==1]
extra2 <- sleep$extra[sleep$group==2]
diff <- extra2-extra1

t.test(diff)
hist(diff)

sleep[[1]]
sleep[1]
is.vector(sleep[[1]])
is.vector(sleep[1])
str(sleep[1])
is.data.frame(sleep[1])
sleep[1,1]


myvec <- c(5,"Laura",7.9)
myvec
is.character(myvec)
