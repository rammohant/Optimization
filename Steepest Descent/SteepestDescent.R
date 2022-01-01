# Optimization Notes 
# 8.31.21

# <- or = as assignment operator 
f1prime <- function( x1 ) {
  result1 <- 2*x1*exp(-x1^2) + x1^2*exp(-x1^2)*(-2*x1)
  result1 <- result1 + 2*(x1-3)*exp(-(x1-5)^2) 
  result1 <- result1 + (x1-3)^2*exp(-(x1-5)^2)*(-2*(x1-5))
  result1 <- result1 + 4*exp(-(x1-2)^2)
  result1 <- result1 + 4*(x1-7)*exp(-(x1-2)^2)*(-2*(x1-2))
  return( result1 )
}

x1 <- seq(-10,10,by = 0.01)
f1prime(-1.25)

x0 <- -1.25
h1 <- 0.25
x1 <- x0 + h1*sign( f1prime( x0 ) )
x1

h1 <- h1/2
x2 <- x1 + h1*sign( f1prime( x1 ) )
x2

x3 <- x2 + h1*sign( f1prime( x2 ) )
x3

h1 <- h1/2
x4 <- x3 + h1*sign( f1prime( x3 ) )
x4

x5 <- x4 + h1*sign( f1prime( x4 ) )
x5

h1 <- h1/2
x5 <- x4 + h1*sign( f1prime( x4 ) )
x5

x6 <- x5 + h1*sign( f1prime( x5 ) )
x6

f1prime(-1)

error1 <- 1 # Error measurement 
tol <- 0.001 # tolerance (epsilon)
x0 <- 0 
x1 <- 1 

while( error1 > tol ) { # start value
  x0hold <- x0
  f1p <- sign( f1prime( x0 ) )
  x0 <- x0 + h1*f1p
  f1phold <- sign( f1prime( x0hold ) )
  
  error1 <- abs( x0 - x0hold )
}



