##########################################
# Production Problem 9/30/21
##########################################

# prices 
c2 <- c(375, #A1
        993.5, #A2
        159, #A3
        450, #B1
        0, #B2
        212, #B3
        0, #C1
        3477.25, #C2
        212, #C3
        937, #D1
        0, #D2
        106) #D3

#             A1 A2 A3 B1 B2 B3 c1 c2 c3 D1 D2 D3     
A2 <- matrix(c(1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
               100, 0, 0, 120, 0, 0, 0, 0, 0, 250, 0, 0,
               0, 50, 0, 0, 0, 0, 0, 175, 0, 0, 0, 0,
               0, 0, 75, 0, 0, 100, 0, 0, 100, 0, 0, 50), 
             nrow = 7, byrow =TRUE)
b2 <- c(24,
        24,
        24,
        24,
        2500,
        1200,
        4500)
q2 <- c("<=",
        "<=",
        "<=",
        "<=",
        ">=",
        ">=",
        ">=")

lp3 <- lpSolve::lp("max",c2,A2,q2,b2)
sol2 <- lp3$solution

A2%%sol2
# Note that ouput reveals the number of hours each machine produces a product (EX. xA1 = time machine A produces product 1)
#  xA1 = 0, xA1 = 0, xA1 =  24, xA1 = 0, xA1 =  0,, xA1 = 24,, xA1 =   0 24  0 18  0  6
sol2