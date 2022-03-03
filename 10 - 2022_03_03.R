#Thursday, March 3, 2022
#Notes 4-3 (continued)

library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(gridExtra)

myvalues <- 1:20
ggplot(NULL,aes(x=myvalues,
                y=myvalues,
                shape=myvalues))+
  geom_point(size=5)+
  scale_shape_identity()


#Star Wars example
View(starwars)
table(starwars$species)
mystarwars <- mutate(starwars,
                     myspeciescolor=if_else(species == "Human",
                                                                 "blue",
                                                                 "green"))
ggplot(mystarwars,aes(x=height,
                      y=mass,
                      color=myspeciescolor)) +
  geom_point() +
  scale_color_identity()

#Solutions + Next illustration
mystarwars <- mutate(starwars,
                     myspeciescolor=if_else(species=="Human",
                                            "blue",
                                            "green"))
mystarwars <- dplyr::filter(mystarwars,!is.na(species))
ggplot(mystarwars,aes(x=height,
                      y=mass,
                      color=myspeciescolor)) +
  geom_point() +
  scale_color_identity(guide="legend",
                       name="Species",
                       labels=c("blue"="Human","green"="Not Human"))

#facet_wrap examples

View(diamonds)

rnorm(1)

set.seed(2320)
#In class, I showed this. Below is what I should have done!!
diam <- ggplot(filter(sample_n(diamonds,1000),
                      cut %in% c("Ideal","Premium")),
               aes(x=carat,y=price))+
  geom_point(alpha=0.75)+
  geom_smooth(se=FALSE)
#update
diam <- ggplot(sample_n(filter(diamonds,
                               cut %in% c("Ideal","Premium")),
                        1000),
                       aes(x=carat,y=price))+
  geom_point(alpha=0.75)+
  geom_smooth(se=FALSE)
diam
diam + facet_wrap(~cut)
diam + facet_wrap(color~cut)
diam + facet_wrap(color~cut,ncol=7)

?facet_wrap


#facet_wrap vs. facet_grid
g <- ggplot(mpg,aes(x=displ,y=hwy))
g + geom_point(alpha=0.3) + facet_grid(cyl~class)
g + geom_point(alpha=0.3) + facet_wrap(cyl~class)

#grid.arrange examples
library(gridExtra)
g1 <- ggplot(Orange,aes(x=factor(age),y=circumference)) + geom_boxplot()
g2 <- ggplot(Orange,aes(x=age,y=circumference)) + geom_point()
g3 <- ggplot(Orange,aes(x=circumference)) + geom_histogram(color="white")
g4 <- ggplot(Orange,aes(x=factor(Tree),y=circumference)) + geom_boxplot()


grid.arrange(g1,g2,g3,g4, ncol=2, nrow=2)
grid.arrange(g2,arrangeGrob(g3,g4,ncol=2),nrow=2)
grid.arrange(g1,g2,g3,nrow=3)
grid.arrange(g2,arrangeGrob(g3,g4,nrow=2),nrow=1)

