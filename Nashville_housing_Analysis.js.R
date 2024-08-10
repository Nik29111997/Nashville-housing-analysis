# Load necessary libraries
library(readr)
library(dplyr)
library(ggplot2)
library(psych)

# Load the dataset
nashville_housing <- read_csv("/users/nik/downloads/Nashville_Housing.csv")

# View the first few rows of the dataset
head(nashville_housing)

# Descriptive Statistics
describe(nashville_housing)

# Histogram of SalePrice
x = nashville_housing$SalePrice
h <- hist(x, breaks=10, col="red", xlab="Sale Price", main="Sale Price Distribution")
xfit <- seq(min(x), max(x), length=40)
yfit <- dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col="blue", lwd=2)

# Q. Test if the mean SalePrice is significantly different from a hypothesized value, e.g., $300,000.
# One Sample t-test
t.test(nashville_housing$SalePrice, mu=300000)

# Building a simple linear regression model to predict SalePrice based on Bedrooms.
# Simple Linear Regression
simple.fit <- lm(SalePrice ~ Bedrooms, data=nashville_housing)
summary(simple.fit)

# Creating a multiple linear regression model using several predictors.
# Multiple Linear Regression
model2 <- lm(SalePrice ~ Bedrooms + Acreage + YearBuilt + TotalBathrooms, data=nashville_housing)
summary(model2)