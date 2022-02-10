#Thursday, February 10, 2022
#Notes 3

#Announcements:
#1. I need a volunteer notetaker!
#2. Submit your Proof of Progress for PP#1.
#3. Solutions to PP#1 should be available on Moodle.
#4. Due Thursday - Reflection on PP#1, Forums, and Proof or Progress on PP#2

#Please download the following files for today's class:
#Age Data
#bison
#Temperature Anomalies.txt
#StatewideBridges

#A few comments about functions, arguments, and help files!
?sample

#Example
library(readr)
twilight <- read_table2("~/STS 347/0_Spring 2022/Notes/Data/Lesson 3 - Age Data.txt", 
                        comment = "!")
#Import function: read_table2()
View(twilight)

str(twilight)

#use menu options to install the tibble package
library(tibble)
is.tibble(twilight)
is_tibble(twilight)

library(readr)
Lesson_3_Temperature_Anomalies <- read_csv("~/STS 347/0_Spring 2022/Notes/Data/Lesson 3 - Temperature Anomalies.txt", 
                                           skip = 10)
#NEW FUNCTION = read_csv()
View(Lesson_3_Temperature_Anomalies)

library(readxl)
bison <- read_excel("~/STS 347/0_Spring 2022/Notes/Data/Lesson 3 - bison.xlsx")
#Import selects: read_excel()
View(bison)
names(bison)
bison$`Northern herd spring calf ratio`
bison$`PDSI (both herds)`

#Lesson 3, Activity 1
#1
library(readxl)
bridges <- read_excel("~/STS 347/0_Spring 2022/Notes/Data/Lesson+3+-+StatewideBridges.xls")
View(bridges)
#2
summary(bridges)
#3
hist(bridges$YEARBUILT)
#4
Alamance <- bridges[bridges$COUNTY == "ALAMANCE",]
#4b
length(Alamance$YEARBUILT)
#4c
min(Alamance$YEARBUILT)
#4d
max(Alamance$YEARBUILT)
#4e
table(Alamance$STRUCTURALLYDEFICIENT)
