data(iris)

filename<-"Iris_sepal_petal_scatterplot.png"
resolution<-300

png(filename ,width=6,height = 6,units = "in",res = resolution)

plot(iris$Sepal.Length,iris$Petal.Length,
     main="Scatterplot of sepal length vs petal length",
     xlab = "sepal length(cm)",
     ylab = "petal length(cm)",
     pch=21,col="blue")

dev.off()