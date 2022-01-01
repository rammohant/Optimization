% Numerical methods - Gausse Newton 
% 11/11/21

x0 = 1; 
h0 = 0.001; 

% Easier to implement
(f1 ( x0 + h0 ) - f1 ( x0 - h0 ) ) / (2 * h0)

% first derivative equation 
f1p ( x0 ) 

% Difference between manual and derived equations 
(f1 ( x0 + h0 ) - f1 ( x0 - h0 ) ) / (2 * h0) - f1p ( x0 ) 

(f1 (x0 + h0) - 2*f1(x0)  + f1 ( x0 - h0 ) ) / (h0 ^ 2) % Derived

f1pp (x0) 

% Gausse Newton: x0 - manual (gradient) / derived
x0 = x0 -  ( ( (f1 ( x0 + h0 ) - f1 ( x0 - h0 ) ) / (2 * h0) - f1p ( x0 ) ) / ( ( f1 (x0 + h0) - 2*f1(x0)  + f1 ( x0 - h0 ) ) / (h0 ^ 2) ) )

