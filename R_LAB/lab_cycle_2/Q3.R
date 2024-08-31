data(mtcars)

cyl_trans<-table(mtcars$cyl,mtcars$am)

barplot(cyl_trans,
        beside=TRUE,
        col=c("lightblue","lightgreen"),
        xlab="Number of cylinders",
        ylab="Count of Cars",
        main="Number of Cars by Cylinder Count and Transmission Type")

legend("topright",legend=c("Automatic_0","Manua1_1"),
        fill=c("lightblue","lightgreen"),
       title="Transmission Type")


