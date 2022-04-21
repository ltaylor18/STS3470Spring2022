#Thursday, 4/21
#Notes 6A & Notes 6B

library(dplyr)
library(ggplot2)

########################
## Notes 6A Continued ##
########################

#Example 3
average <- 87 #70 #77 # # 
if(average >= 90 &  average <= 100) {grade <- "A"}
if(average >= 80 &  average < 90){grade <- "B"}
if(average >= 70 &  average  < 80){grade <- "C"}
if(average >= 60 &  average  < 70){grade <- "D"}
if(average < 60){grade <- "F"}
grade

average <- 103
if(average >= 90 &  average <= 100) {grade <- "A"}
if(average >= 80 &  average < 90){grade <- "B"}
if(average >= 70 &  average  < 80){grade <- "C"}
if(average >= 60 &  average  < 70){grade <- "D"}
if(average < 60){grade <- "F"}
grade

rm(grade)
average <- 103
if(average >= 90 &  average <= 100) {grade <- "A"}
if(average >= 80 &  average < 90){grade <- "B"}
if(average >= 70 &  average  < 80){grade <- "C"}
if(average >= 60 &  average  < 70){grade <- "D"}
if(average < 60){grade <- "F"}
grade

#One remedy to the 103 problem!
average <- 103
if(average >= 90) {grade <- "A"}
if(average >= 80 &  average < 90){grade <- "B"}
if(average >= 70 &  average  < 80){grade <- "C"}
if(average >= 60 &  average  < 70){grade <- "D"}
if(average < 60){grade <- "F"}
grade

#5, p. 6
average <- c(87, 70, 100, 95) #changed average to a vector!
if(average >= 90) {grade <- "A"}
if(average >= 80 &  average < 90){grade <- "B"}
if(average >= 70 &  average  < 80){grade <- "C"}
if(average >= 60 &  average  < 70){grade <- "D"}
if(average < 60){grade <- "F"}
grade


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
average <- 85 # Try values of 95 and 91 and 85
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
average <- 85 # Try values of 95 and 91 and 85
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

#Example 1
w <- rnorm(30,500,50)
myCI <- t.test(w)$conf.int[1:2]
lower <- myCI[1]
upper <- myCI[2]


if_else(lower <= 500 & upper >= 500,
        "My interval captured the mean of 500!",
        "My interval did not capture the mean of 500!")

if_else(between(500,lower,upper),
        "My interval captured the mean of 500!",
        "My interval did not capture the mean of 500!")


#Example #2
if(lower <= 500 & upper >= 500){
  "My interval captured the mean of 500!"
} else {
  "My interval did not capture the mean of 500!"
}

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
mysum <- 0 #initializing or giving mysum a starting value
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
#Error message of object not found
#We can't create objects in a for loop, need to
#"initialize" before using in the loop or give a starting
#value before using in the loop!

#Example 4C
mysum <- 0
for(k in 1:10){
  mysum <- mysum + k
}

#Calculate the sum of 1 to 100
mysum <- 0
for(k in 1:100){
  mysum <- mysum + k
}


#Example 5
mysum <- 1
for(k in 2:10){
  mysum[k] <- mysum[k-1] + k
}
mysum

#Example 5 - Follow-up Questions
mysum <- 0
for(k in 1:10){
  mysum[k] <- mysum[k] + k
}
mysum

#Example 6
m <- NULL
mymat <- matrix(1:30,nrow=5,ncol=6,byrow=TRUE)
for(i in 1:length(mymat[1,])){
  m[i] <- mean(mymat[,i])
}

