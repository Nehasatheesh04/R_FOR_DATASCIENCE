# Load the mtcars dataset
data("mtcars")

# Display the first few rows of the dataset to understand its structure
head(mtcars)

# Perform Pearson correlation test between horsepower (hp) and miles per gallon (mpg)
cor_test <- cor.test(mtcars$hp, mtcars$mpg, method = "pearson")

# Display the results of the correlation test
print(cor_test)
