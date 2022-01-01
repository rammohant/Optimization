% Comment key 
% Matlab likes semicolons

function y1 = f1 ( x1 ) 
    result1 = x1^2*exp(-x1^2); 
    result1 = result1 + (x1-3)^2*exp( -(x1-3)^2 ); 
    y1 = result1; 

