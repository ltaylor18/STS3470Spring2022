#Thursday, 4/14
#Notes 5-2B

#p.3
View(sleep) #default version of sleep data

library(dplyr)
sleep.sorted <- arrange(sleep,ID)

#base
extra1 <- sleep.sorted$extra[sleep.sorted$group == 1]
#dplyr
extra2 <- select(filter(sleep.sorted,group==2),extra)

diff <- extra1-extra2

mysleep <- data.frame(extra1,extra2,diff)
mysleep <- rename(mysleep,extra2=extra,
                  diff=extra.1)

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

