#!/usr/bin/env Rscript
# @Author: vargash1
# @Name:   Vargas, Hector
# @Email:  vargash1@wit.edu

# Read in data, attach it for ease of use
neon_data <- read.csv("neon.csv")
hydrogen_data <- read.csv("hydrogen.csv")

# Utility functions  For calculations
rad2deg <- function(rad) {(rad * 180) / (pi)}
deg2rad <- function(deg) {(deg * pi) / (180)}

# Lambda = a * sin(theta) /n
# Note a is converted to meters
lab_lambda <- function(l_theta, l_n, element_zero){
    ((3.3 * (10^-6)) * (sin(deg2rad(l_theta - element_zero)))) / (l_n)
}
# E = h *(c/lambda)
# h = Planks constant
# c = speed of light
nrg_lambda <- function(l_lambda){
    (6.626 * (10^-34)) * ((3 * 10^8)/(l_lambda))
}

get_neon_data <- function(){
    neon_zero <- 17.90
    for(i in 1:8){
        t_value <- neon_data$Theta[i]
        n_value <- neon_data$n[i]
        temp <- nrg_lambda(lab_lambda(t_value, n_value, neon_zero))
        cat("Neon Value for Theta:\t",t_value,
            "\tEnergy Level(n): ",n_value, "\tE: ", temp, "\n")
    }
}
get_hydrogen_data <-function(){
    hydrogen_zero <- 17.75
    for(i in 1:8){
        t_value <- hydrogen_data$Theta[i]
        n_value <- hydrogen_data$n[i]
        temp <- nrg_lambda(lab_lambda(t_value, n_value, hydrogen_zero))
        cat("Hydrogen Value for Theta:\t",t_value,
            "\tEnergy Level(n): ",n_value, "\tE: ", temp, "\n")
    }
}
cat("Neon Calculations\n---\n")
get_neon_data()
cat("Hydrogen Calculations\n---\n")
get_hydrogen_data()
