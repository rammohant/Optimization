% Integer Programming 10/12/21

% convert c1 to negative if WE ARE MAXIMIZING, matlab minimizes by default
c1 = [-12; -10; -20; -50; -70; -80; -200]; 

%Switch signs of anything that was greater than (lower bound)
a1 = [-1 -1 -1 -1 -1 -1 -1; 
       576 1200 1645 2240 2436 3150 4307;
       79 99 119 149 179 199 249; 
       -1 0 0 0 0 0 0;
       0 -1 0 0 0 0 0;
       0 0 -1 0 0 0 0;
       0 0 0 -1 0 0 0;
       0 0 0 0 -1 0 0;
       0 0 0 0 0 -1 0;
       0 0 0 0 0 0 -1;
       1 1 1 1 1 1 1] ; 

b1 = [-92; 200000; 16000; -12*0.8; -14*0.8; -19*0.8; -30*0.8; -30*0.8; -7*0.8; -3*0.8; 115]; 

linprog (c1,a1,b1,[],[],zeros(1,7), []) 

% where intcon in MatLab = int.vec in R 
intlinprog (c1,1:7, a1,b1,[],[],zeros(1,7), []) % mixed integer programming
