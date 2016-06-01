#!/usr/bin/env Rscript
# @Author: vargash1
# @Name:   Vargas, Hector
# @Email:  vargash1@wit.edu

neon_data <- read.csv("neon.csv", stringsAsFactors=FALSE)
hydrogen_data <- read.csv("hydrogen.csv", stringsAsFactors=FALSE)
redLED_data <- read.csv("redled.csv", stringsAsFactors=FALSE)
neon_zero <- 17.90
hydrogen_zero <- 17.75
redLED_zero <- 5.00

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
photon_enrgy <- function(l_lambda){
    (6.626 * (10^-34)) * ((3 * 10^8)/(l_lambda))
}

get_data <- function(element_data, element_zero, element_color){
    cat(element_color, "Calculations\n---\n")
    for(i in 1:length(element_data$Theta)){
        t_value <- element_data$Theta[i]
        n_value <- element_data$n[i]
        o_color <- element_data$Color[i]
        lambda_value <- lab_lambda(t_value, n_value, element_zero)
        energy_level <- photon_enrgy(lambda_value)
        cat(element_color,
            " Theta:\t",t_value,
            "\tn): ",n_value,
            "\tE: ", energy_level,
            "\tLambda: ", lambda_value,
            "\t Color:", o_color,
            "\n")
    }
}
get_data(neon_data, neon_zero, "Neon")
get_data(hydrogen_data, hydrogen_zero, "Hydrogen")
get_data(redLED_data, redLED_zero, "Red LED Bulb")
