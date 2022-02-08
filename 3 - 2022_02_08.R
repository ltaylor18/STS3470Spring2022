#Tuesday, February 8, 2022
#Notes 2 Continued

#We need these objects from last time:
cells <- c(1,26,24,68)
rnames <- c("R1","R2")
cnames <- c("C1","C2")
mymatrix <- matrix(cells,
                   nrow=2,
                   ncol=2,
                   byrow=TRUE,
                   dimnames=list(rnames,cnames))