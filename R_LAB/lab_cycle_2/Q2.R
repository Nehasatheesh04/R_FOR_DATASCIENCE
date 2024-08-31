data(mtcars)

colors<-c("blue","brown","green")
cyl_colors<-colors[as.factor(mtcars$cyl)]

plot(mtcars$disp,mtcars$mpg,
     col=cyl_colors,
     pch=19,
     xlab="Displacement",
     ylab="Miles Per Gallon(MPG)",
     main="Scatterplot of MPG vs Displacement")

legend("topright",legend = levels(as.factor(mtcars$cyl)),
       col=colors,pch=19,title = "Number of cylinders")

lines(loess.smooth(mtcars$disp,mtcars$mpg),col="black",lwd=2)