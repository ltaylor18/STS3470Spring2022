#Tuesday, February 22, 2022
#Notes 4-1 continued
#Notes 4-2

##################################
#Check out the SPDC events today!#
##################################
library(dplyr)
d2 <- ggplot(diamonds,aes(y=price)) + 
  geom_boxplot()
d2

#Example code from student's research project:
library(dplyr)
QBoutput_3 <- QBoutput_2 %>% group_by(Name) %>% summarise(AVGGames_Played=mean(`Games Played`),
                                                          AVGPassing_Percent=mean(Passing...9),
                                                          AVGPassing_YRDS=mean(Passing...10),
                                                          AVGPassing_TDS=mean(Passing...11),
                                                          AVG_INTS=mean(Passing...12),
                                                          AVG_SACKS=mean(Passing...13),
                                                          AVG_RTG=mean(Passing...14),
                                                          AVG_RSH_ATPS=mean(Rushing...15),
                                                          AVGRUSH_YRDS=mean(Rushing...16),
                                                          AVGRUSH_YRDS_PER_ATPS=mean(Rushing...17),
                                                          AVGRUSH_TDS=mean(Rushing...18),
                                                          AVG_FUMBLE=mean(Fumbles...19),
                                                          AVG_FUMBLE_LST=mean(Fumbles...20))

QBoutput_4 <- full_join(QBoutput_3, QBoutput1,"Name") #See Practice Problems 4

QBoutput_4$Total <- as.numeric(gsub("[//$,]","",QBoutput_4$Total))

QBLOG <- QBoutput_4
QBLOG <- mutate(QBLOG, Indicator=if_else(is.na(QBLOG$Total), 0, 1))

#Notes 4-1 p. 8-9 Example
ggplot(mtcars,aes(x=mpg,y=cyl)) + geom_boxplot()
ggplot(mtcars,aes(x=mpg,group=cyl)) + geom_boxplot()
ggplot(Orange,aes(x=age,y=Tree)) + geom_boxplot()
ggplot(Orange,aes(x=age,group=Tree)) + geom_boxplot()

#4
is.numeric(mtcars$cyl)
is.factor(mtcars$cyl)

is.numeric(Orange$Tree)
is.factor(Orange$Tree)


#6
ggplot(mtcars,aes(x=mpg,y=factor(cyl))) + 
  geom_boxplot()


str(mtcars)
str(Orange)

#Histograms

ggplot(diamonds,aes(x=price)) + 
  geom_histogram()

#warning about picking a better bin width!

ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=25)

ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=25,
                 color="white")
ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=25,
                 color="purple")

#Some bin extremes...
ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=3)
ggplot(diamonds,aes(x=price)) + 
  geom_histogram(bins=1000)

hist(diamonds$price)

#Bar plot

#geom_bar example
ggplot(diamonds,aes(x=cut)) +
  geom_bar()

ggplot(diamonds,aes(x=cut)) +
  geom_bar(fill="purple")

ggplot(diamonds,aes(x=cut)) +
  geom_bar(aes(fill=color))

#geom_col example
Majors <- c("A&S","Bus","Comm","Edu","Other")
Count <- c(2894,2046,1374,257,591)
Elon <- data.frame(Majors,Count)

ggplot(Elon,aes(x=Majors,y=Count))+
  geom_col()

#1 Need an x and y mapping where x=category, y=counts

#2/#3
ggplot(Elon,aes(x=Majors,y=Count,fill=Majors))+
  geom_col()
ggplot(Elon,aes(x=Majors,y=Count))+
  geom_col(aes(fill=Majors))

