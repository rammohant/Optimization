% Genetic Algorithm: Transporation Time Problem 
% 12/9/21
% uses tx1

% starting value must make sense
% x12, x13, x23, x24, x34
x0 = [0 0 0 1 4] % x24 + x34 = 5
x0 = [0 4 0 1 4] % x13 = x23 + x34
x0 = [1 4 0 1 4] % x24 = x12 + x23 FINAL 

% Step 1: Create a candidate value 
% a. Select the index to change (pick a random one to change and take a step)
idx1 = randsample(5,1); % samples integers 1 to n 
idx1 = 2
step1 = 0.01; 
x1 = x0;

f0 = tx1(x0); %objective function 

% if we change the first one, repeat for each one 
if idx1 == 1 
    x1c = step1*randn(1);
    x1(1) = x0(1) + x1c; % changing one will change them all, so to fix this, add if then 
    x1(4) = x1(1) + x1(3); % x1(4) = x24 = x12 + x23
    x1(5) = 5 - x1(4); 
    x1(3) = x1(3) + x1(5); 
end
if idx1 == 2 
    x1c = step1*randn(1);
    x1(2) = x0(2) + x1c; % changing one will change them all, so to fix this, add if then 
    x1(5) = x1(2) - x1(3);
    x1(4) = 5 - x1(5); 
    x1(1) = x1(4) - x1(3); % x1(1) = x24 - x23
end
if idx1 == 3 % NOT DONE
    x1c = step1*randn(1);
    x1(1) = x0(1) + x1c; % changing one will change them all, so to fix this, add if then 
    x1(4) = x1(1) + x1(3); % x1(4) = x24 = x12 + x23
    x1(5) = 5 - x1(4); 
    x1(3) = x1(3) + x1(5); 
end
if idx1 == 4 % NOT DONE
    x1c = step1*randn(1);
    x1(1) = x0(1) + x1c; % changing one will change them all, so to fix this, add if then 
    x1(4) = x1(1) + x1(3); % x1(4) = x24 = x12 + x23
    x1(5) = 5 - x1(4); 
    x1(3) = x1(3) + x1(5); 
end
if idx1 == 5 % NOT DONE
    x1c = step1*randn(1);
    x1(1) = x0(1) + x1c; % changing one will change them all, so to fix this, add if then 
    x1(4) = x1(1) + x1(3); % x1(4) = x24 = x12 + x23
    x1(5) = 5 - x1(4); 
    x1(3) = x1(3) + x1(5); 
end
f1 = tx1(x1); 

diff1 = f1 - f0;
U1 = log( rand(1) ); 
if (diff1 > U1)
    x0 = x1; 
    f0 = f1; % so you don't have to evalute it again (always do this for acceptance algorithms) 
end

