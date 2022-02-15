#Tuesday, February 15, 2022
#Notes 3 continued

#Announcements:
#1. Due Thursday - Reflection on PP#1, Forums, and Proof or Progress on PP#2

#Please download the following files for today's class:
#Age Data
#bison
#Temperature Anomalies.txt
#StatewideBridges

#Sit with your new teams for the next two weeks.
#Introduce yourselves and as a team list all of the functions that
#we have used thus far in class.
#Complete the Socrative Warm-Up!


#A few comments about functions, arguments, and help files!
?sample

#Example 1
x <- seq(1,10)
median(x)
quantile(x,.5)
mean(x,trim=0.5)

#Example 2
x <- 1:10
out <- summary(x)
out[2]
quantile(x,.25)

#install.packages("dplyr")

library(dplyr)
library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2022/Notes/Data/Lesson+3+-+StatewideBridges.xls")
View(bridges)

Alamance3 <- filter(bridges,COUNTY=="ALAMANCE")
Alamance3 <- dplyr::filter(bridges,COUNTY=="ALAMANCE")

exercise1 <- dplyr::filter(bridges,STRUCTURALLYDEFICIENT=="SD")
View(exercise1)
unique(exercise1$STRUCTURALLYDEFICIENT)
table(exercise1$STRUCTURALLYDEFICIENT)
summary(exercise1$STRUCTURALLYDEFICIENT)

exercise2 <- dplyr::filter(bridges,YEARBUILT < 2000)

exercise3 <- dplyr::filter(bridges,
                           COUNTY=="ALAMANCE",
                             STRUCTURALLYDEFICIENT=="SD")

exercise3 <- dplyr::filter(bridges,
                           COUNTY=="ALAMANCE" &
                           STRUCTURALLYDEFICIENT=="SD")