#Thursday, February 17, 2022
#Notes 3 continued
#Notes 4-1

#Announcements:
#1. Due Thursday - PP#3, Forum, NO REFLECTION
#2. Work on first video and assessment for project


#Lesson 3 - Activity 3

#Chunk 1
library(dplyr)
data(mtcars)
mtcars2 <- mtcars
?mtcars

#Chunk 2
summary(mtcars2) #base
summarize(mtcars2) #dplyr
summarise(mtcars2) #dplyr

#Chunk 3
summary(mtcars$mpg) #base
summarize(mtcars2,mymean=mean(mpg)) #dplyr

#Chunk 4
summarize(mtcars2,mysd=sd(mpg))

#Chunk 5
summarize(mtcars2,
          mymin=min(mpg),
          myq1=quantile(mpg,.25),
          mymed=median(mpg),
          mymean=mean(mpg),
          myq3=quantile(mpg,.75),
          mymax=max(mpg))

#Chunk 6
auto <- filter(mtcars2,am==0)
manual <- filter(mtcars2,am==1)
View(auto)
View(manual)

#Chunk 7
summarize(mtcars2,n())
summarize(auto,n())
summarize(manual,n())

#Chunk 8
example <- filter(mtcars2,hp < 150)
arrange(example,hp)
View(example)


#Chunk 9
example <- arrange(example,hp)
example[1,]      # HERE
example <- arrange(example,desc(hp))
example[1,]      # HERE

summary(example$hp) #To verify!

#Chunk 10
example2 <- filter(mtcars,gear < 4 & carb==1)
example2 <- filter(mtcars,gear < 4, carb==1)

#Chunk 11
example3 <- filter(mtcars,gear < 4 | carb==1)

#Chunk 12
#Write code to determine how many 
#observations are in example2 and example3
summarize(example2,n())
length(example3[,1])
dim(example3)

#Chunk 13
chunk13 <- filter(mtcars,cyl %in% c(4,8))

#Chunk 14
#Make another copy of mtcars!
mtcars3 <- mtcars
group_by(mtcars3,gear) #A
View(mtcars3) #B
summarize(mtcars3,mean1=mean(mpg)) #C


#Chunk 15
mymtcars <- group_by(mtcars3,gear) 
View(mymtcars)
summarize(mymtcars,mean1=mean(mpg)) 

#Chunk 16
summarize(mymtcars,mysd=sd(hp))

#Chunk 17
ungroup(mymtcars)
summarize(mymtcars,mean=mean(hp))


#Chunk 18
mymtcars <- ungroup(mymtcars)
summarize(mymtcars,mean=mean(hp))

#Chunk 19
mtcars2$mpquart <- mtcars2$mpg/4 #base
mtcars2 <- mutate(mtcars2,mpquart2 = mpg/4) #dplyr
View(mtcars2)


#Getting summary statistics by groups:
diet1 <- filter(ChickWeight,Diet==1)
diet2 <- filter(ChickWeight,Diet==2)
diet3 <- filter(ChickWeight,Diet==3)
diet4 <- filter(ChickWeight,Diet==4)
mean(diet1$weight)
mean(diet2$weight)
mean(diet3$weight)
mean(diet4$weight)

summarize(group_by(ChickWeight,Diet),mean(weight))


#A few comments about functions, arguments, and help files!
?sample

library(ggplot2)

#Scatterplots
head(Orange)
summary(Orange)
names(Orange)
View(Orange)
str(Orange)
tail(Orange)
?Orange

p <- ggplot(Orange,aes(x=age,y=circumference))
p + geom_point()

p2 <- ggplot(Orange,aes(x=age,y=circumference,color="blue"))
p2 + geom_point()

p + geom_point(aes(color="blue"))

p3 <- ggplot(Orange,aes(x=age,y=circumference,color=Tree))
p3 + geom_point()

p + geom_point(color="blue")

#Boxplots
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot()

#1
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot() +
  geom_point()

#2
ggplot(ToothGrowth,aes(x=supp,y=len)) + 
  geom_boxplot() +
  geom_point() +
  coord_flip()

#3
#Same as coord_flip - change x and y!
ggplot(ToothGrowth,aes(y=supp,x=len)) + 
  geom_boxplot() +
  geom_point()

#4
ggplot(ToothGrowth,aes(y=supp,x=len)) + 
  geom_boxplot(fill="green") +
  geom_point(color="blue")


#Diamonds examples
head(diamonds)
View(diamonds)
summary(diamonds)

d <- ggplot(diamonds,aes(x=price,y=cut)) + 
  geom_boxplot()
d

#1
d + scale_x_log10()

#2
#d + scale_x_
d + scale_x_reverse()
d + scale_x_sqrt()

#3 - swap x and y
d2 <- ggplot(diamonds,aes(y=price,x=cut)) + 
  geom_boxplot()

d2 + scale_x_log10() #This doesn't work now!
#Solution?
d2 + scale_y_log10()
