# 12/2/21, 12/7/21
# Stochastic Optimization 
# Easy to do if you don't have the time to do the math because you don't have to get the derivative of constraints, etc. 
# Just change theta 
# May not get you the EXACT answer 

# Let's make a hideous function
theta1 <- function( x1 ) {
  result1 <- 13 + 0.3*x1 + 
          3*exp( -abs (x1 - 3)*3) +
          4*exp( -abs (x1 - 4)*3) +
          5*exp( -abs (x1 - 5)*3) +
          16*exp( -abs (x1 - 6)*3) +
          7*exp( -abs (x1 - 7)*3) +
          8*exp( -abs (x1 - 8)*3) +
          9*exp( -abs (x1 - 9)*3) +
           - 0.02*x1^2
  return( result1 )
}

# plot graph
x1 <- seq( 0, 20, by = 0.01 )
y1 <- theta1(x1)

plot (x1, y1, col = "black", type = "l", ylim = c(0,35)) #xlim = x(0,5)

# 12/2/21
# METHOD 1 (Not efficient) ------------------------------------------------------------------

x0 <- 2 # picking a starting point EX. 15
points(x0,0)
count1 <- 0

for (i in 1:1000) { 
  x1 <- x0 + rnorm(1,0,0.5) # Very dependent on 0.5 VS 0.1, rnadomly proposes something EX. 0.9
  points ( x1, 0, col = "red")
  
  # if it works, it goes there
  if( theta1( x1 ) > theta1( x0)) {
    x0 <- x1
    points ( x0, 0, col = "blue")
    segments (x0, 0, x0, theta1(x0), col = "blue")
    count1 <- count1 + 1
  }
}

# TO FIND SOLUTION
maximizer <- x0 
maximum <- theta1(x0)

# 12/7/21
# METHOD 2: Simulated Annealing ------------------------------------------------------------------

# Option 1: Static t value 
x0 <- 15
temp1 <- 0.1 # (10, 1, 0.1) lower t is more effective at finding the solution... as you decrease, you have less lines
out1 <- matrix( 0, nrow = 1000, ncol = 2) 

for (i in 1:1000) { 
  
  # Right now, we are only moving randomly in one direction, but you can make it go randomly in many directions
  x1 <- x0 + rnorm(1,0,0.9) # Very dependent on 0.5 VS 0.1, rnadomly proposes something
  points ( x1, 0, col = "red")
  diff1 <- theta1( x1 ) - theta1( x0 )
  Enrg1 <- exp( diff1/temp1 )
  u1 <- runif(1,0,1)
  
  # store every place you went
  out1[i,1] <- x1
  out1[i,2] <- theta1( x1 )
  
  # if it works, it goes there
  if( Enrg1 > u1) {
    x0 <- x1
    points ( x0, 0, col = "blue")
    segments (x0, 0, x0, theta1(x0), col = "blue")
    count1 <- count1 + 1
  }
}

# unlike method 1, last one is not always the right answer, so you'll have to store these off
maximizer <- x0 
maximum <- theta1(x0)

# TO FIND SOLUTION
# Find location in out1 that has maximum 
# Note that it might show up with more than one location if max is not unique
maxloc <- which( out1[,2] == max( out1[,2]))
out1[maxloc,]

# OPTION 2: temp value decrements every time --------------------------------------
# t is more reactive 

x0 <- 1
out1 <- matrix( 0, nrow = 1000, ncol = 2) 

temp1 <- 10 # (10, 1, 0.1) lower t is more effective at finding the solution... as you decrease, you have less lines
for (i in 1:1000) { 
  
  x1 <- x0 + rnorm(1,0,0.9) # Very dependent on 0.5 VS 0.1, rnadomly proposes something
  points ( x1, 0, col = "red")
  diff1 <- theta1( x1 ) - theta1( x0 )
  Enrg1 <- exp( diff1/temp1 )
  u1 <- runif(1,0,1)
  
  # store every place you went
  out1[i,1] <- x1
  out1[i,2] <- theta1( x1 )
  
  # if it works, it goes there
  if( Enrg1 > u1) {
    x0 <- x1
    points ( x0, 0, col = "blue")
    segments (x0, 0, x0, theta1(x0), col = "blue")
    count1 <- count1 + 1
  }
  
  # Vary t so that every iteration it decreases
  temp1 <- max( temp1 - 0.01, 0.01)
}

maxloc <- which( out1[,2] == max( out1[,2]))
out1[maxloc,]

# OPTION 3: temp value decrements every time the point is accepted --------------------------------------
# where we want to start

x0 <- 1
out1 <- matrix( 0, nrow = 1000, ncol = 2) 

# how sensitive it is to accept 
temp1 <- 10 # (10, 1, 0.1) lower t is more effective at finding the solution... as you decrease, you have less lines
for (i in 1:1000) { 
  
  x1 <- x0 + rnorm(1,0,0.9) # Very dependent on 0.5 VS 0.1, rnadomly proposes something
  points ( x1, 0, col = "red")
  diff1 <- theta1( x1 ) - theta1( x0 )
  Enrg1 <- exp( diff1/temp1 )
  u1 <- runif(1,0,1)
  
  # store every place you went
  out1[i,1] <- x1
  out1[i,2] <- theta1( x1 )
  
  # if it works, it goes there
  if( Enrg1 > u1) {
    x0 <- x1
    points ( x0, 0, col = "blue")
    segments (x0, 0, x0, theta1(x0), col = "blue")
    count1 <- count1 + 1
    # Vary t so that every iteration it decreases IF the point is accepted
    temp1 <- max( temp1 - 0.01, 0.01)
  }
}

# TO FIND SOLUTION
# Find location in out1 that has maximum 
# Note that it might show up with more than one location if max is not unique
maxloc <- which( out1[,2] == max( out1[,2]))
out1[maxloc,]

# TRY YOURSELF: Leave osscilation to you!! EX. the cosine example in the notes --------------------------------------
# -t*k/1000

# --------------------------------------



