#!/usr/bin/env Rscript
# @Author: vargash1
# @Name:   Vargas, Hector
# @Email:  vargash1@wit.edu

# Pennies
# ------------------------------------------------------
weight_data <- read.csv("weight.csv")
volume_data <- read.csv("vol.csv")

attach(weight_data)
attach(volume_data)

cat("Pre  82 Weight Mean: ", mean(PRE_WEIGHT), "\n",
    "Post 82 Weight Mean: ", mean(POST_WEIGHT), "\n",
    "Pre  82 Volume Mean: ", mean(PRE_VOL), "\n",
    "Post 82 Volume Mean: ", mean(POST_VOL), "\n",
    "Pre  Std. Deviation(Weight): ", sd(PRE_WEIGHT), "\n",
    "Post Std. Deviation(Weight): ", sd(POST_WEIGHT), "\n",
    "Pre  Std. Deviation(Volume): ", sd(PRE_VOL), "\n",
    "Post Std. Deviation(Volume): ", sd(POST_VOL), "\n"
)

# Intrinsic Properties
# ------------------------------------------------------
copper_weight <- 0.3475
cat("Pre  82 Weight after acid bath: ",
    3.0370, "\n",
    "Post 82 Weight after acid bath: ",
    1.9255, "\n",
    "Copper before acid bath: ",
    copper_weight, "\n",
    "Copper after  acid bath: ",
    0.3464, "\n"
)
