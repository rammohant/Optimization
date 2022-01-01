% Main program 
x1 = 5; % Semi colon will suppress output
f1(x1)
f1p(x1)

x1 = x1 - f1(x1)/f1p(x1)

x1 = x1 - f1p(x1)/f1pp(x1)
y1 = f1(x1)