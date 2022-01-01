function y1 = f1p ( x1 ) 
    result1 = 2*x1*exp(-x1^2); 
    result1 = result1 + x1^2*exp(-x1^2)*(-2*x1); 
    result1 = result1 + 2*(x1-3)*exp( -(x1-3)^2 ); 
    result1 = result1 + (x1-3)^2*exp( -(x1-3)^2 )*(-2*(x1-3)); 
    y1 = result1; 