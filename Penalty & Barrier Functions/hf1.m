% Hessian
function out1 = Hf1( x1, x2 )
  d_x1_x1 = (-2*((2*pi^2 - 81*(-1 + 2*x1^2 + 4*x1*x2 + 2*x2^2))*cos((2*pi*x1)/9) - 36*pi*(x1 + x2)*sin((2*pi*x1)/9))*sin((2*pi*x2)/7))/(81*exp((x1 + x2)^2));
  d_x1_x2 = (4*pi*sin((2*pi*x1)/9)*(-(pi*cos((2*pi*x2)/7)) + 7*(x1 + x2)*sin((2*pi*x2)/7)) - 18*cos((2*pi*x1)/9)*(2*pi*(x1 + x2)*cos((2*pi*x2)/7) - 7*(-1 + 2*x1^2 + 4*x1*x2 + 2*x2^2)*sin((2*pi*x2)/7)))/(63*exp((x1 + x2)^2));
  d_x2_x2 = (-2*cos((2*pi*x1)/9)*(28*pi*(x1 + x2)*cos((2*pi*x2)/7) + (2*pi^2 - 49*(-1 + 2*x1^2 + 4*x1*x2 + 2*x2^2))*sin((2*pi*x2)/7)))/(49*exp((x1 + x2)^2));
  out1 = [ d_x1_x1  d_x1_x2 ;
          d_x1_x2  d_x2_x2 ];
end

% Numerical Derivative/Gradient
function f1 = df1( x1, x2 )
  res1 = -2*pi/9*sin( 2*pi/9*x1)*sin( 2*pi/7*x2)*exp(-(x1 + x2)^2);
  res1 = res1 + cos( 2*pi/9*x1)*sin( 2*pi/7*x2)*exp(-(x1 + x2)^2)*(-2*(x1+x2));
  res2 = cos( 2*pi/9*x1)*exp(-(x1 + x2)^2)*2*pi/7*cos( 2*pi/7*x2 );
  res2 = res2 + cos( 2*pi/9*x1)*sin( 2*pi/7*x2)*exp(-(x1 + x2)^2)*(-2*(x1+x2));
  f1 = [res1; res2];
end

%XX = 4/9 *pi* exp(-(x + y)^2) * (x + y)* sin((2 *pi* x)/9) * sin((2 *pi* y)/7) - 4/81 *pi^2 *exp(-(x + y)^2) *cos((2 *pi* x)/9) *sin((2 *pi* y)/7);
%XY = 4/9 *pi* exp(-(x + y)^2) * (x + y)* sin((2 *pi* x)/9) * sin((2 *pi* y)/7) - 4/63 *pi^2 *exp(-(x + y)^2) *sin((2 *pi* x)/9) *sin((2 *pi* y)/7);
%YY; 

% put original obective into wolphrams alpha (cos 2*pi...) 