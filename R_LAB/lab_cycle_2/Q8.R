# Load necessary libraries
library(ggplot2)
library(dplyr)

titanic_data <- read.csv("C:/Users/Neha satheesh/Downloads/titanic.csv")

# View the column names in your dataset
colnames(titanic_data)

ggplot(data, aes(x = Parch)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Histogram of Number of Parents and Children Aboard",
       x = "Number of Parents and Children Aboard (parch)",
       y = "Frequency") +
  theme_minimal()

#B
install.packages("tidyr")

library(tidyr)
library(stats)

# Descriptive Statistics
summary(titanic_data)

# Survival rate by class
class_survival_rate <- titanic_data %>%
  group_by(Pclass) %>%
  summarize(Survival_Rate = mean(Survived, na.rm = TRUE))
print(class_survival_rate)

# Survival rate by gender
gender_survival_rate <- titanic_data %>%
  group_by(Sex) %>%
  summarize(Survival_Rate = mean(Survived, na.rm = TRUE))
print(gender_survival_rate)

# Survival rate by age (binned)
titanic_data$AgeBin <- cut(titanic_data$Age, breaks = seq(0, 80, by = 10), right = FALSE)
age_survival_rate <- titanic_data %>%
  group_by(AgeBin) %>%
  summarize(Survival_Rate = mean(Survived, na.rm = TRUE))
print(age_survival_rate)

# Correlation Analysis (only for numeric variables)
correlation_matrix <- cor(titanic_data %>% select_if(is.numeric), use = "complete.obs")
print(correlation_matrix)

# Statistical Test: Chi-Square Test of Independence for categorical variables
# e.g., Survival vs Class
class_survival_table <- table(titanic_data$Pclass, titanic_data$Survived)
chi_square_test_class <- chisq.test(class_survival_table)
print(chi_square_test_class)

# e.g., Survival vs Gender
gender_survival_table <- table(titanic_data$Sex, titanic_data$Survived)
chi_square_test_gender <- chisq.test(gender_survival_table)
print(chi_square_test_gender)

#c

# Plot the box plot
ggplot(titanic_data, aes(x = factor(Survived), y = Age, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Age Distribution of Survivors and Non-Survivors",
       x = "Survived (0 = No, 1 = Yes)",
       y = "Age") +
  theme_minimal() +
  scale_fill_manual(values = c("red", "green"), labels = c("Non-Survivor", "Survivor"))

