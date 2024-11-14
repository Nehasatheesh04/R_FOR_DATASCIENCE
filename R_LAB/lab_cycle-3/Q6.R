# Load necessary libraries
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(corrplot)) install.packages("corrplot")
if (!require(MASS)) install.packages("MASS") # Contains the Boston dataset

library(ggplot2)
library(corrplot)
library(MASS)

# Load the Boston dataset
data("Boston")
head(Boston)

# Check the structure of the dataset
str(Boston)

# Summary of the dataset
summary(Boston)

# Correlation matrix
correlation_matrix <- cor(Boston)
corrplot(correlation_matrix, method = "color", type = "upper", tl.cex = 0.7)

# Pair plot of selected variables
pairs(Boston[, c("medv", "lstat", "rm", "age", "crim")], 
      main = "Pair Plot of Selected Variables")

# Histogram of median values
ggplot(Boston, aes(x = medv)) + 
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  labs(title = "Distribution of Median Value of Owner-Occupied Homes", x = "Median Value", y = "Frequency")

# Scatter plot for RM (average number of rooms per dwelling) vs MEDV (Median value of owner-occupied homes)
ggplot(Boston, aes(x = rm, y = medv)) +
  geom_point(alpha = 0.6) +
  labs(title = "Average Number of Rooms vs. Median Home Value", x = "Average Number of Rooms", y = "Median Value") +
  theme_minimal()

# Simple linear regression model
simple_model <- lm(medv ~ lstat, data = Boston)
summary(simple_model)

# Multiple linear regression model
multiple_model <- lm(medv ~ ., data = Boston)
summary(multiple_model)

# Predict median values on the dataset
predicted_values <- predict(multiple_model, newdata = Boston)

# Display first few predicted values
head(predicted_values)

# Plot actual vs predicted median values
ggplot(data = Boston, aes(x = medv, y = predicted_values)) +
  geom_point(color = "blue") +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  labs(title = "Actual vs Predicted Median Value", x = "Actual Median Value", y = "Predicted Median Value")



