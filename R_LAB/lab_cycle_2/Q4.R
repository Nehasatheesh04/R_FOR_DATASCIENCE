data("mtcars")

mean_mpg<-mean(mtcars$mpg)
sd_mpg<-sd(mtcars$mpg)

hist(mtcars$mpg,
     breaks=10,
     col=colorRampPalette(c("lightblue","darkblue"))(10),
     main="Histogram of miles per gallon(MPG)",
     xlab="miles per gallon(mpg)",
     ylab="frequency",
     border="white")

abline(v=mean_mpg,col="red",lwd=2,lty=2)

text(mean_mpg,5,paste("mean:",round(mean_mpg,2)),col="red",pos=3)
text(mean_mpg,4,paste("SD:",round(sd_mpg,2)),col="red",pos=3)


     