# Load necessary libraries
library(ggplot2)

# Step a: Load the dataset
# Replace 'path_to_file.csv' with the actual path to the downloaded CSV file
data <- read.csv("E:/R_LAB/lab_cycle-3/Q1/train.csv")

# Preview the dataset
head(data)

# Assuming the dataset has columns named "price" and "size" for simplicity
# You may need to rename these columns if they differ in your actual dataset
# Rename columns if necessary
colnames(data)[which(names(data) == "SalePrice")] <- "price"
colnames(data)[which(names(data) == "GrLivArea")] <- "size"

# Step b: Check if 'price' and 'size' columns exist
if(!("price" %in% colnames(data)) | !("size" %in% colnames(data))) {
  stop("Columns 'price' and 'size' are not found in the dataset.")
}

# Step c: Fit a simple linear regression model
model <- lm(price ~ size, data = data)

# Step d: Calculate the regression coefficients
intercept <- coef(model)[1]
slope <- coef(model)[2]
cat("Intercept:", intercept, "\n")
cat("Slope:", slope, "\n")

# Step e: Plot the regression line along with the scatter plot of the data points
ggplot(data, aes(x = size, y = price)) +
  geom_point(color = "blue", alpha = 0.6) + # Scatter plot of data points
  geom_abline(intercept = intercept, slope = slope, color = "red", size = 1) + # Regression line
  labs(title = "House Price Prediction based on Size",
       x = "Size (square feet)",
       y = "Price") +
  theme_minimal()
