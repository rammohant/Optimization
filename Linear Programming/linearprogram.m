% Linear Programming 9/23/21
% Note: Matlab is not dimension happy

% Simple Problem
c1 = [1 -3]; 
a1 = [-1 2; 
        1 1]; 
b1 = [6 ; 5 ]; 

x = linprog( c1, a1, b1 );

% McDonald's Problem
c2 = [1.39 ; 1.99; 1; 3.79]; 

a2 = [ -220 -170 -300 -379; 
    10 10 14 20; 
    180 330 745 582 ]; 
b2 = [ -1000; 46; 2300 ]; 

lb1 = [0; 0; 0; 0]; 
% Note: need to add lower bound, so we need blank arguments for Aeq, Beq, and upperbound
x = linprog( c2, a2, b2,[],[],lb1,[]); 

% Production Problem 
c3 = [375; 993.5; 159; 450; 0; 212; 0; 3477.25; 212; 937; 0; 106];

% Since all your constraints have to be a less then format, switch the sign
% for the second set of constraints
a3 = [1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 1 1 1 0 0 0 0 0 0;
       0 0 0 0 0 0 1 1 1 0 0 0;
       0 0 0 0 0 0 0 0 0 1 1 1;
       -100 0 0 -120 0 0 0 0 0 -250 0 0;
       0 -50 0 0 0 0 0 -175 0 0 0 0;
       0 0 -75 0 0 -100 0 0 -100 0 0 -50];
   
b3 = [24; 24; 24; 24; -2500; -1200; -4500];

lb3 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]; 
x3 = linprog(c3, a3, b3,[],[],lb3,[]); 

x3; 

    