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

# Polynomial regression can capture non-linear relationships between the predictors and the response variable.
# Polynomial Regression
poly_model <- lm(SalePrice ~ poly(Bedrooms, 2) + poly(Acreage, 2) + poly(YearBuilt, 2) + poly(TotalBathrooms, 2), data=nashville_housing)
summary(poly_model)

# Decision trees can model non-linear relationships and interactions between variables.
# Load necessary library
library(rpart)

# Decision Tree
tree_model <- rpart(SalePrice ~ Bedrooms + Acreage + YearBuilt + TotalBathrooms, data=nashville_housing, method="anova")
print(tree_model)

# Random forest is an ensemble method that improves prediction accuracy by averaging multiple decision trees.
# Load necessary library
library(randomForest)

# Random Forest
rf_model <- randomForest(SalePrice ~ Bedrooms + Acreage + YearBuilt + TotalBathrooms, data=nashville_housing, ntree=100)
print(rf_model)

# Lasso regression is useful for feature selection and regularization, which can help in reducing model complexity.
# Load necessary library
library(glmnet)

# Prepare data for glmnet
x <- model.matrix(SalePrice ~ Bedrooms + Acreage + YearBuilt + TotalBathrooms, data=nashville_housing)[,-1]
y <- nashville_housing$SalePrice

# Lasso Regression
lasso_model <- glmnet(x, y, alpha=1)
print(lasso_model)




