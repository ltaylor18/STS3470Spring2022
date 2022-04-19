#Notes 6 Script

##############
## Notes 6A ##
##############

x <- rnorm(30,0,1)
pval <- t.test(x,alternative="two.sided",mu=100)$p.value
library(dplyr)
library(ggplot2)

#Method 1
if(pval < 0.05) {print("Results are significant at the 0.05 level.")}
if(pval > 0.05) {print("Results are not significant at the 0.05 level.")}
if(pval == 0.05) {print("The p-value equals 0.05, the significance level.")}

#Method 2
if(pval < 0.05){
  print("Results are significant at the 0.05 level.")
} else{
  print("Results are not significant at the 0.05 level.")
}

#Method 3
if(pval < 0.05){
  print("Results are significant at the 0.05 level.")
} else if(pval > 0.05){
  print("Results are not significant at the 0.05 level.")
} else {
  print("The p-value equals 0.05, the significance level.")
}

#Method 4
if_else(pval < 0.05, 
        "Results are significant at the 0.05 level.",
        "Results are not significant at the 0.05 level.",
        "Missing p-value.")

#Method 5
case_when(pval < 0.05 ~ "Results are significant at the 0.05 level.",
          pval > 0.05 ~ "Results are not significant at the 0.05 level.",
          pval == 0.05 ~ "The p-value equals 0.05, the significance level.")

#Illustration, p.2
x <- rnorm(1)
x
if(x > 0) {
  statement <- paste(x, "is a positive number.", sep=" ")
  print(statement)
} else if (x < 0) {
  statement <- paste(x, "is a negative number.", sep=" ")
  print(statement)
  abs.x <- abs(x)
  statement2 <- paste("The absolute value is ", abs.x, sep="")
  print(statement2)
} else {
  print("The value is 0!")
}

#Illustration, p. 3
x <- c(-1:1,NA)
case_when(x > 0 ~ paste(x, 
                        " is a positive number.", 
                        sep=""),
          x < 0 ~ paste(x, 
                        " is a negative number. The absolute value is ", 
                        abs(x), 
                        sep=""),
          x == 0 ~ paste("The value is 0!"),
          TRUE ~ paste("Missing value!")
)


#Example 1
w <- rnorm(30)
t <- (mean(w)-0)/(sd(w)/sqrt(30))


# Method 2

if(________________){____________________________________
  
} else {________________________}

# Method 4

if_else(__________________, 
                          
                          ______________________________________, 
                          
                          ______________________________________)

#Example 2
w <- rnorm(30)
t <- (mean(w)-0)/(sd(w)/sqrt(30))

# Method 3

if(__________) {
  
  ____________________________________
  
} else if(____________){
  
  ____________________________________
  
} else {
  
  _________
  
}

# Method 5

case_when(__________ ~ ________________________________,
                    
                    __________ ~ ________________________________,
                    
                    __________ ~ ___)


#Example 3
average <- 77
if(average ____ 90 &  average ____ 100) {grade <- "A"}
if(average ____ 80 &  average ____ 90){grade <- "B"}
if(average ____ 70 &  average  ____ 80){grade <- "C"}
if(average ____ 60 &  average  ____ 70){grade <- "D"}
if(average ____ 60){grade <- "F"}
grade















































#Don't peak!













#Solution A to #3 and #4:
average <- 103
if(average >=  90  & average <=  100) {grade <- "A"
} else if(average  >= 80  & average <  90){grade <- "B"
} else if(average >=   70 &  average <  80){grade <- "C"
} else if(average  >= 60  & average <  70){grade <- "D"
} else if(average >= 0 & average  < 60){grade <- "F"
} else {grade <- "ERROR"
}
grade

#Solution B to #3 and #4:
average <- 75
if(average > 100) {grade <- "ERROR"
} else if(average >=  90  ) {grade <- "A"
} else if(average  >= 80  ){grade <- "B"
} else if(average >=   70 ){grade <- "C"
} else if(average  >= 60  ){grade <- "D"
} else if(average >= 0 ){grade <- "F"
} else {grade <- "ERROR"
}
grade

#Solution C to #5 is:
average <- c(80,87,70,103,-95)
grade <- case_when(average >= 90 & average <= 100 ~ "A",
                   average >= 80 & average < 90 ~ "B",
                   average >= 70 & average < 80 ~ "C",
                   average >= 60 & average < 70 ~ "D",
                   average >= 0 & average < 60 ~ "F",
                   TRUE ~ "ERROR")
grade

data.frame(average,grade)

#Illustration #1, p. 7
grade <- NULL
average <- 95 # Try values of 95 and 91 and 85
if(average >=  90  & average <=  100) {
  grade <- "A"
  print("First condition checked")
} else if(average  >= 90  & average <=  93){ # This condition overlaps previous condition
  grade <- "A-"
  print("Second condition checked")
} else {
  grade <- "ERROR"
  print("ELSE condition")
}
grade

#Illustration #2, p. 7
grade <- NULL
average <- 95 # Try values of 95 and 91 and 85
if(average >=  90  & average <=  100) {
  grade <- "A"
  print("First condition checked")} 
if(average  >= 90  & average <=  93){ # This condition overlaps previous condition
  grade <- "A-"
  print("Second condition checked")} 
if(average > 100 | average < 90) {
  grade <- "ERROR"
  print("ELSE condition")}
grade

##############
## Notes 6B ##
##############

mydata <- matrix(rnorm(3000),nrow=1000)
mymeans1 <- apply(mydata,1,mean)

mymeans2 <- replicate(1000,mean(rnorm(3)))

#Example 1
for(i in 1:5) {print(i)}

#Example 2
for(index in seq(0,10,2)) {print(index)}

#Example 3
for(j in c(1,12,50)){
  print(j)
  print(2*j)
}

#Example 4A
mysum <- 0
for(k in 1:10){
  mysum <- mysum + k
}
mysum

#Example 4B
rm(mysum)
for(k in 1:10){
  mysum <- mysum + k
}
mysum

#Example 4C
mysum <- 0
for(k in 1:10){
  mysum <- mysum + k
}

#Example 5
sum <- 1
for(k in 2:10){
  sum[k] <- sum[k-1] + k
}
sum

#Example 6
m <- NULL
mymat <- matrix(1:30,nrow=5,ncol=6,byrow=TRUE)
for(i in 1:length(mymat[1,])){
  m[i] <- mean(mymat[,i])
}

#Example 7
mysequence <- seq(100,2,-2)
for(i in mysequence){print(i/2)}


#Example, p. 4
mymeans3 <- __________
for(___ in _____){
  mymeans3[_______] <- mean(rnorm(3))
}

