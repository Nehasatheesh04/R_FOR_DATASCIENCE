# Load the mtcars dataset
data("mtcars")

# Check the structure of the gear column
# Convert gear to a factor for ANOVA analysis
mtcars$gear <- as.factor(mtcars$gear)

# Perform one-way ANOVA to test for variations in displacement (disp) across gear types
anova_test <- aov(disp ~ gear, data = mtcars)

# Display the ANOVA test summary
summary(anova_test)
