#########################
# Barrier Functions  with Gausse-Newton for Single Variable
#########################

#Starting value 
x1 <- 0 

f1 <- function( x ) {
  result1 <- x - x^2
  return( result1 )
}

theta1 <- function (x) {
  result1 <- f1( x ) - max0(0.05 - exp(-6*(x+1)))^10
  result1 <- result1 - max0( 0.03 - sin( x*pi / 192))^3
}

x2 <- seq( 0, 1, by = 0.001 )
plot( x2, f1(x2), type = "l")
lines(x2, theta1( x2 ), col = "blue")

# gradient vector
thetaprime1 <- function( x ) {
  result1 <- 1 - 2*x 
  result1 <- result1 - 10*max0(0.05 - exp(-6*(x+1)))^9*(6*exp(-6*(x+1)))
  result1 <- result1 - 4*max0( 0.03 - sin( x*pi / 192))^3*(-cos(x*pi/192)*pi/192)
  return(result1)
}

thetaprime2 <- function( x ) {
  result1 <- 369*exp(-6*(x+1))*max0(0.05 - exp(-6*(x+1)))^9
  result1 <- result1 - 3240*exp(-12*(x+1))*max0(0.05 - exp(-6*(x+1)))^8
  result1 <- result1 - pi^2/9216*sin(pi*x/192)*max0( 0.03 - sin( x*pi / 192))^3
  result1 <- result1 - pi^2/3072*cos(pi*x/192)*max0( 0.03 - sin( x*pi / 192))^2
  result1 <- result1 - 2
  return(result1)
}

#Give me the maximum or 0
max0 <- function( x ) {
  result1 <- max( x, 0 )
  return(result1)
}

x1 <- x1 - thetaprime1(x1)/thetaprime2(x1)

