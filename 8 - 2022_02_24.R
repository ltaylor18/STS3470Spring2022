#Tuesday, February 22, 2022
#Notes 4-2

library(ggplot2)
#Last example from Notes 4-1
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

############
##Notes 4-2#
############

p <- ggplot(Orange,aes(x=age,y=circumference,color=Tree))
p + geom_point() + 
  labs(title="Scatterplot of Circumference by Age",
       subtitle="By L. Taylor",
       x="Age (Days since 12/31/1968)",
       y="Circumference (mm)",
       color="Tree ID", #What did this change?
       caption="STS 347, Notes 4-2") 

