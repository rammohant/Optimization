% Penalty + Barrier Function: Gausse Newton
% 11/16/21 
% Uses hf1.m, df1.m file 

% Starting value
x0 = [1; 1];
 
x0 = x0 - inv( hf1(x0(1),x0(2)))*df1(x0(10), x0(2)); 

error1 = 1; 
counter = 0; 
while error1 > 0.000001
    x1hold = x0;
    x0 = x0 - inv( hf1(x0(1),x0(2)))*df1(x0(1), x0(2));
    error1 = sum( abs(x1hold - x0) ); 
    counter = counter +1;
end