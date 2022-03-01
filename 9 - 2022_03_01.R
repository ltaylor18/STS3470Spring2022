#Tuesday, March 1, 2022
#Notes 4-2 (continued)
#Notes 4-3

library(ggplot2)
library(dplyr)
library(RColorBrewer)

#####################################
#Texas Housing One Possible Solution#
#####################################
fig <- ggplot(txhousing,
              aes(x=factor(year),
                  y=sales,
                  fill=factor(year)))
fig + 
  geom_boxplot(show.legend=FALSE, 
               outlier.color="red", 
               outlier.alpha=0.2) +
  labs(x="Year",
       y="Number of Sales",
       title="Texas Housing Sales",
       subtitle="2000-2015",
       caption="Source: R data.") +
  coord_flip()


#Adding features
g <- ggplot(trees,aes(x=Height,y=Girth))
g + geom_point(size=4) + 
  geom_vline(xintercept=64, col="red",linetype=2,size=2) + 
  geom_hline(yintercept=15) + 
  geom_abline(slope=0.1,intercept=5,color="purple",size=3,linetype=3) +
  geom_segment(x=70,xend=80,y=10,yend=18,color="green") +
  geom_text(x=66,y=18,label="My Height",color="magenta") +
  geom_smooth(method="lm",se=FALSE) +
  geom_text(x=80,y=20,label="r=0.519")

#Least-Squares Regression Scatterplot
#Challenge Problem Solution

myx <- c(2,2,10)
myy <- c(2,6,10)
mygroup <- c("A","B","C")

mydata <- data.frame(myx,myy,mygroup)

myfig <- ggplot(mydata,aes(x=myx,y=myy))
myfig + 
  geom_smooth(method="lm",se=FALSE,color="purple",size=2) +
  geom_segment(x=2,xend=2,y=4,yend=6,color="green",linetype=2) +
  geom_segment(x=2,xend=2,y=4,yend=2,color="red",linetype=2) +
  geom_point(aes(color=mygroup),size=5,show.legend=FALSE) +
  labs(x="Explanatory Variable",
       y="Response Variable",
       title="A Graph Showing Residuals",
       subtitle="The Least-Squares Regression Line") +
  geom_text(x=3,y=3,label="Residual = (-2)*(-2)=4",color="red") + 
  geom_text(x=3,y=5,label="Residual = (2)*(2)=4",color="green") + 
  geom_text(x=8.5,y=10,label="Residual = 0*0 = 0",color="blue") +
  geom_text(x=7,y=6.5,label="Sum of Squared Residuals = 8",
            color="purple") 

#############
##Notes 4-3##
#############

library(ggplot2)
xvals <- c(1:10,100)
yvals <- c(seq(2,20,2),0)
mycolors <- c(rep("orange",10),"green")

mydata <- data.frame(xvals=xvals,yvals=yvals,mycolors=mycolors)
g <- ggplot(mydata,aes(x=xvals,y=yvals)) + 
  geom_point(size=3,aes(color=mycolors)) + 
  geom_smooth(method="lm",se=FALSE)
g


library(plotly)
ggplotly(g)





library(dplyr)
mystarwars <- mutate(starwars,
                     myspeciescolor=if_else(_____________________,
                                                                 "_______",
                                                                 "_______"))
ggplot(mystarwars,aes(x=height,
                      y=mass,
                      color=____________________)) +
  geom_point() +
  __________________________()



