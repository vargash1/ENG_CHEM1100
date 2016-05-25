#!/usr/bin/env Rscript
# @Author: vargash1
# @Name:   Vargas, Hector
# @Email:  vargash1@wit.edu

# Read in data, attach it for ease of use
spectro_data <- read.csv("data.csv")
attach(spectro_data)

# Calculate linear model based off data
lin_model <- lm(ABS~MOLPERL)
print(lin_model)
summary(lin_model)

# Plot the graph, as well as the linear regression model.
plot(MOLPERL,ABS,
    xlab = "ABS",
    ylab = "mol/L")
abline(-0.03713,6.84098)

#Calculate the correlation coefficients
cor_cof <- cor(MOLPERL,ABS)
cor_det <- cor_cof^2

#Print out the data
cat( "x", lin_model$coefficients[1], "\n",
     "y", lin_model$coefficients[2], "\n",
     "Correlation Determination", cor_det, "\n",
     "Correlation Coefficient  ", cor_cof, "\n")
