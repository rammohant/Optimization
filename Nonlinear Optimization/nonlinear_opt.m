% main for Nonlinear optimization
% uses obj.m for objective and df1.m for gradient 

% Starting value
x0 = [1; 1];

% Step Size
h0 = [0.01; 0.01]; 

% Take one step
x1 = x0 + h0.*sign(df1(x0(1),x0(2)));

% Evaluate the function at the inital Point
obj(x0(1),x0(2));

% Evaluate the function after the first step
obj(x1(1),x1(2));

% Putting everything in a loop
% For loop
for i = 1:100
    x0 = x0 + h0.*sign( df1( x0(1), x0(2) ) ); 
    obj( x0(1), x0(2) );
    x0; 
end

% Steepest Descent for Nonlinear optimization
error1 = 1; %initialize the error
count1 = 0; 
halve1 = [1;1]; 
while error1 > 0.0000001
     obj0 = obj( x0(1), x0(2) );
     x0hold = x0; 
     x0 = x0 + h0.*sign( df1( x0(1), x0(2) ) );
     dfhold0 = df1( x0(1), x0(2) );
     dfhold1 = df1( x0hold(1), x0hold(2)); 
     for j = 1:2 
        if sign(dfhold0(j)) ~= sign(dfhold1(j))
            halve1(j) = 0.5;
        else
            halve1(j) = 1; 
        end
     end
     h0 = h0.*halve1; 
     % if (sign(df1( x0(1), x0(2) )) ~= sign(df1( x0hold(1), x0hold(2) )) )
         %h0(sign(df1( x0(1), x0(2) )) ~= sign(df1( x0hold(1), x0hold(2) )) );
     %end
     obj1 = obj( x0(1), x0(2) );
     error1 = abs(obj0 - obj1); 
     count1 = count1 + 1; 
end

obj1
x0
count1