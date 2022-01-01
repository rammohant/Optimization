##########################################
# Integer and Binary Programming: TV Product Ordering & Frito-Lay Problem
##########################################

#load packages
if(!require("osmdata")) install.packages("osmdata")
if(!require("tidyverse")) install.packages("tidyverse")
if(!require("sf")) install.packages("sf")
if(!require("ggmap")) install.packages("ggmap")

library(tidyverse)
library(osmdata)
library(sf)
library(ggmap)
library(lpSolve)

##########################################
# TV Product Ordering Problem
##########################################
c1 <- c(12, #x1
        10, #x2
        20, #x3
        50, #x4
        70, #x5
        80, #x6
        200 #x7
      )
#               x1 x2 x3 x4 x5 x6 x7 
a1 <- matrix( c(1, 1, 1, 1, 1, 1, 1, # Demand
                576,1200,1645,2240,2436,3150,4307, # Space
                79,99,119,149,179,199,249, # cost 
                1, 0, 0, 0, 0, 0, 0,
                0, 1, 0, 0, 0, 0, 0,
                0, 0, 1, 0, 0, 0, 0,
                0, 0, 0, 1, 0, 0, 0,
                0, 0, 0, 0, 1, 0, 0,
                0, 0, 0, 0, 0, 1, 0,
                0, 0, 0, 0, 0, 0, 1,
                1, 1, 1, 1, 1, 1, 1),
              nrow = 11, 
              byrow = TRUE)
b1 <- c(92, 
        200000,
        16000,
        12*0.8,
        14*0.8,
        19*0.8,
        30*0.8,
        30*0.8,
        7*0.8,
        3*0.8, 
        115)
q1 <- c(">=", 
        "<=", 
        "<=", 
        ">=", 
        ">=",
        ">=", 
        ">=", 
        ">=",
        ">=",
        ">=",
        "<=")
lp2 <- lpSolve::lp("max",c1, a1,q1,b1, int.vec = 1:7) 
lp2$solution

a1%%lp2$solution

##########################################
# FritoLay: Small Problem
##########################################

#Start small and then add on
d1 <- read.csv(file.choose())

N1 <- nrow( d1 ) # number of stores 
W1 <- 4 # number of warehouses

c1a <- c( d1$TimeA, d1$TimeB, d1$TimeC, d1$TimeD )
c1 <- 2*c1a + 30 # Round trip time store to warehouse 

# Ensures delivery to each store (Diagonal of 1 truck per store)
# Check about how we ensure delivery
temp <- diag( 1, N1)
A1 <- cbind( diag( 1, N1), # warehouse 1 
             diag( 1, N1), # warehouse 2 
             diag( 1, N1), # warehouse 3
             diag( 1, N1)) # warehouse 4 
b1 <- rep(1, N1)

# Count the number of trucks
A2 <- c( rep(1,N1), rep(0,N1), rep(0, N1), rep(0,N1)) 
A3 <- c( rep(0,N1), rep(1,N1), rep(0, N1), rep(0,N1))
A4 <- c( rep(0,N1), rep(0,N1), rep(1, N1), rep(0,N1))
A5 <- c( rep(0,N1), rep(0,N1), rep(0, N1), rep(1,N1))
         
# b2 <- c(50,50,50,50) # of trucks 
b2 <- c(39,50,50,50) # of trucks 

# Stack on to the other one 
A1 <- rbind( A1, 
             t(A2),
             t(A3),
             t(A4),
             t(A5)
             )

b1 <- c( b1, b2)

q1 <- c(rep("=",N1), "<=", "<=", "<=", "<=")

lp2 <- lpSolve::lp("min",c1,A1,q1,b1, all.bin = TRUE) 
ans <- lp2$solution #Check out c1 to see the order of the stores (all for Time1, then all for Time2, etc.)

# Where does it go? Counts the number of stores that goes to each warehouse
A2%*%lp2$solution # when both A2 and ans is 1 
A3%*%lp2$solution
A4%*%lp2$solution
A5%*%lp2$solution 

# OPTION 1 
# Address1 <- c( d1$Address, d1$Address, d1$Address, d1$Address)
# Address2 <- ilelse (lp2$solution == 1, Address1)

W1 <- lp2$solution[1:128]
W2 <- lp2$solution[129:256]
W3 <- lp2$solution[257:384]
W4 <- lp2$solution[385:512]

AddressW1 <- d1$Address[ W1 == 1]
AddressW2 <- d1$Address[ W2 == 1]
AddressW3 <- d1$Address[ W3 == 1]
AddressW4 <- d1$Address[ W4 == 1]

library(osmdata)
library(OpenStreetMap)
library(maps)
library(ggmap)
locs <- c(
geocode(locs, source = Google)
)
