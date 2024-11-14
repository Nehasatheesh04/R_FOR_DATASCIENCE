# Install necessary packages if not already installed
if (!require(forecast)) install.packages("forecast")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")


# Load libraries
library(forecast)
library(ggplot2)
library(dplyr)

# Load the dataset
url <- "https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv"
covid_data <- read.csv(url)

# Filter data for India within the specified date range
covid_data$Date <- as.Date(covid_data$Date)
india_data <- covid_data %>%
  filter(Country.Region == "India" & Date >= "2020-01-22" & Date <= "2020-12-15") %>%
  select(Date, Confirmed, Deaths)

# Step a: Univariate Time Series Analysis
# i. Create a time series object for the total positive COVID-19 cases
cases_ts <- ts(india_data$Confirmed, start = c(2020, as.numeric(format(min(india_data$Date), "%j"))), frequency = 365)

# ii. Visualize the time series data using a line chart
ggplot(india_data, aes(x = Date, y = Confirmed)) +
  geom_line(color = "blue") +
  labs(title = "Total COVID-19 Positive Cases in India (Jan 22, 2020 - Dec 15, 2020)",
       x = "Date", y = "Total Positive Cases") +
  theme_minimal()

# Step b: Multivariate Time Series Analysis
# i. Consider total deaths from COVID-19
# ii. Create a multivariate time series object with cases and deaths
cases_deaths_ts <- ts(cbind(Confirmed = india_data$Confirmed, Deaths = india_data$Deaths), 
                      start = c(2020, as.numeric(format(min(india_data$Date), "%j"))), frequency = 365)

# iii. Plot both series on a single chart
autoplot(cases_deaths_ts, facets = FALSE) +
  labs(title = "COVID-19 Cases and Deaths in India (Jan 22, 2020 - Dec 15, 2020)",
       x = "Date", y = "Count") +
  scale_color_manual(values = c("blue", "red"), labels = c("Confirmed Cases", "Deaths")) +
  theme_minimal()

# Step c: Time Series Forecasting
# i. Fit an ARIMA model to the total positive cases
arima_model <- auto.arima(cases_ts)

# ii. Forecast the next 5 data points
forecast_cases <- forecast(arima_model, h = 5)

# iii. Plot the forecasted values
autoplot(forecast_cases) +
  labs(title = "Forecast of COVID-19 Positive Cases in India", 
       x = "Date", y = "Total Positive Cases") +
  theme_minimal()

