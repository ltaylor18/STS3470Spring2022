#Tuesday, 4/19
#Notes 5-2B & Notes 6A

library(dplyr)
library(ggplot2)

#p.9 Simulation, Scenario 1
set.seed(2320)
"Scenario 1 - Different Sample Sizes"
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,15),
                            var.equal=TRUE)$p.value)
sum(pvalsEV <= 0.05)/1000
#p.9 Simulation, Scenario 2
set.seed(6493)
"Scenario 2 - Different Sample Sizes"
pvalsUV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,15),
                            var.equal=FALSE)$p.value) #Change to FALSE!
sum(pvalsUV <= 0.05)/1000

#p.10 Simulation, Scenario 3
set.seed(90210)
"Scenario 3 - Different Sample Sizes"
pvalsEV2 <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,5), #Change to 5
                            var.equal=TRUE)$p.value) #Change back to TRUE!
sum(pvalsEV2 <= 0.05)/1000

#p.10 Simulation, Scenario 4
set.seed(27244)
"Scenario 4 - Different Sample Sizes"
pvalsUV2 <- replicate(1000,
                      t.test(rnorm(100,100,5), 
                             rnorm(20,100,5), #Change to 5
                             var.equal=FALSE)$p.value) #Change back to TRUE!
sum(pvalsUV2 <= 0.05)/1000

#Repeat them all with n=100 for both samples!
#p.9 Simulation, Scenario 1
set.seed(2320)
"Scenario 1 - Same Sample Sizes"
pvalsEVrepeat <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(100,100,15),
                            var.equal=TRUE)$p.value)
sum(pvalsEVrepeat <= 0.05)/1000

#p.9 Simulation, Scenario 2
set.seed(6493)
"Scenario 2 - Same Sample Sizes"
pvalsUVrepeat <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(100,100,15),
                            var.equal=FALSE)$p.value) #Change to FALSE!
sum(pvalsUVrepeat <= 0.05)/1000

#p.10 Simulation, Scenario 3
set.seed(90210)
"Scenario 3 - Same Sample Sizes"
pvalsEV2repeat <- replicate(1000,
                      t.test(rnorm(100,100,5), 
                             rnorm(100,100,5), #Change to 5
                             var.equal=TRUE)$p.value) #Change back to TRUE!
sum(pvalsEV2repeat <= 0.05)/1000

#p.10 Simulation, Scenario 4
set.seed(27244)
"Scenario 4 - Same Sample Sizes"
pvalsUV2repeat <- replicate(1000,
                      t.test(rnorm(100,100,5), 
                             rnorm(100,100,5), #Change to 5
                             var.equal=FALSE)$p.value) #Change back to TRUE!
sum(pvalsUV2repeat <= 0.05)/1000


############
# Notes 6A #
############

x <- rnorm(30,0,1)
pval <- t.test(x,alternative="two.sided",mu=100)$p.value
library(dplyr)
library(ggplot2)

#Method 1
if(pval < 0.05) {print("Results are significant at the 0.05 level.")}
if(pval > 0.05) {print("Results are not significant at the 0.05 level.")}
if(pval == 0.05) {print("The p-value equals 0.05, the significance level.")}

#Method 2
pval <- 0.05
if(pval < 0.05){
  print("Results are significant at the 0.05 level.")
} else{
  print("Results are not significant at the 0.05 level.")
}

#Suppose you wanted 0.05 to be coded as significant
pval <- 0.05
if(pval <= 0.05){ #Note the =
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

#Illustration, p.3
x <- seq(-5,5,1)
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
if(t >= 0){1-pt(t,29)
} else {pt(t,29)}

# Method 4
if_else(t >= 0, 1-pt(t,29), pt(t,29))

#Example 2
w <- rnorm(30)
t <- (mean(w)-0)/(sd(w)/sqrt(30))

# Method 3
if(t>0) {
  1-pt(t,29)
} else if(t<0){
  pt(t,29)
} else {
  1
}

# Method 5
case_when(t>0 ~ 1-pt(t,29),
          t<0 ~ pt(t,29),
          TRUE ~ 1) #or use the condition t==0

out <- case_when(t>0 ~ 1-pt(t,29),
                 t<0 ~ pt(t,29),
                 TRUE ~ 1) #or use the condition t==0
paste("My p-value is ", out)

t <- 1.5
#Our mystery example. Can you figure out what R is cranky?
case_when(t>0 ~ paste("My p-value is ",1-pt(t,29)),
                 t<0 ~ pt(t,29),
                 TRUE ~ 1) #or use the condition t==0


t
pt(t,29)
1-pt(t,29)

#Example 3
average <- 70 #87 #77
if(average >= 90 &  average <= 100) {grade <- "A"}
if(average >= 80 &  average < 90){grade <- "B"}
if(average >= 70 &  average  < 80){grade <- "C"}
if(average >= 60 &  average  < 70){grade <- "D"}
if(average < 60){grade <- "F"}
grade


