#Thursday, 4/14
#Notes 5-2B

#p.3
View(sleep) #default version of sleep data
?sleep

library(dplyr)
sleep.sorted <- arrange(sleep,ID)

#base
extra1 <- sleep.sorted$extra[sleep.sorted$group == 1]
#extra2 <- sleep.sorted$extra[sleep.sorted$group == 2]
#dplyr
extra2 <- select(filter(sleep.sorted,group==2),extra)

diff <- extra1-extra2

mysleep <- data.frame(extra1,extra2,diff)
mysleep <- rename(mysleep,extra2=extra,
                  diff=extra.1)

diff2 <- extra2-extra1
t.test(diff2)

#p.5
auto <- filter(mtcars,am==0) %>% select(hp)
manual <- filter(mtcars,am==1) %>% select(hp)



##Reminder, what are the hypotheses for these tests?
##Reminder, what parameter does the CI estimate?
#Syntax A
t.test(mtcars$hp ~ mtcars$am,
       var.equal=TRUE)
#Syntax B
t.test(mtcars$hp ~ mtcars$am,
       var.equal=FALSE)
#Syntax C
t.test(mtcars$hp ~ mtcars$am)
#Syntax D
t.test(auto,manual)

#1a
var(auto)
var(manual)
#1b
library(ggplot2)
ggplot(mtcars,aes(x=am,y=hp))+
  geom_boxplot() #Wah wah :-(

#First solution
ggplot(mtcars,aes(x=factor(am),y=hp))+
  geom_boxplot() #Woo hoo :-)
#Second solution
ggplot(mtcars,aes(group=am,y=hp))+
  geom_boxplot() #Woo hoo :-)

#2
mean(auto$hp)
mean(manual$hp)

#3
t.test(manual,auto,conf.level=0.99)
myCI <- t.test(manual,auto,conf.level=0.99)$conf.int[1:2]
mean(myCI)
mean(manual$hp)-mean(auto$hp)

#4
t.test(mtcars$hp ~ mtcars$am,alternative="greater")

#p.8
set.seed(6493)
library(ggplot2)
x1 <- rnorm(100,100,5)
x2 <- rnorm(20,100,15)
var(x1)  
var(x2)
t.test(x1,x2,var.equal=TRUE)
t.test(x1,x2,var.equal=FALSE)
val=c(x1,x2)
grp=c(rep("A",100),rep("B",20)) 
mydata <- data.frame(val,grp)
ggplot(mydata,aes(x=grp,y=val)) +    
  geom_boxplot()

#p.9 Simulation
set.seed(2320)
pvalsEV <- replicate(1000,
                     t.test(rnorm(100,100,5), 
                            rnorm(20,100,15),
                            var.equal=TRUE)$p.value)
sum(pvalsEV <= 0.05)/1000
