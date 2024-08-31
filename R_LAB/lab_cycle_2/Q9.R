data("iris")

head(iris)

install.packages("GGally")

library(ggplot2)
library(GGally)
library(dplyr)

data("iris")

head(iris)
str(iris)
summary(iris)

ggplot(iris, aes(x = Sepal.Length, fill = Species))+
  geom_histogram(bins = 20, alpha = 0.7, position = "identity")+
  labs(title = "Distribution of Sepal Length by Species")

ggplot(iris, aes(x = Sepal.Width, fill = Species))+
  geom_histogram(bins = 20, alpha = 0.7, position = "identity")+
  labs(title = "Distribution of Sepal Width by Species")

ggplot(iris, aes(x = Petal.Length, fill = Species))+
  geom_histogram(bins = 20, alpha = 0.7, position = "identity")+
  labs(title = "Distribution of Petal Length by Species")

ggplot(iris, aes(x = Petal.Width, fill = Species))+
  geom_histogram(bins = 20, alpha = 0.7, position = "identity")+
  labs(title = "Distribution of Petal Width by Species")

pairs(iris[1:4], col = iris$Species)

anova_result <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_result)

ggpairs(iris, aes(color = Species, alpha = 0.6))