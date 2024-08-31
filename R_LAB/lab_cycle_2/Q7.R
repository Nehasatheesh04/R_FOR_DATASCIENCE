install.packages("ggplot2")
install.packages("dplyr")


library(ggplot2)
library(dplyr)


data <- read.csv("C:/Users/Neha satheesh/Downloads/archive/time-series-19-covid-combined.csv")


head(data)

# # Filter data for a specific country
country_data <- data %>%
  filter(Country.Region == "India") %>%
  select(Date, Confirmed) %>%
  group_by(Date) %>%
  summarise(Confirmed = sum(Confirmed))

# Step 3: Preprocess the data
#Convert the 'Date' column to Date type
data$Date <- as.Date(data$Date, format="%Y-%m-%d")


ggplot(country_data, aes(x = Date, y = Confirmed)) +
  geom_line(color = "blue") +
  labs(title = "COVID-19 Confirmed Cases Over Time in India",
       x = "Date",
       y = "Number of Confirmed Cases") +
  theme_minimal()

