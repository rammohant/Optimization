% Main file for Least Squares + Euler Solver

% Lynx-Hare Problem 
% Uses LPSOLVE.m, SSLV.m, dSSLV.m 

data1 = readmatrix("LynxHare.txt"); 
n1 = size (data1, 1); 

alpha0 = 0.001;
beta0 = 0.001; % when any two things interact, the coefficient is going to be small
gamma0 = 0.001; 
eta0 = 0.1; 

E0 = data1(1,2); 
F0 = data1(1,3); 
Et = data1(:,2); 
Ft = data1(:,3); 

out2 = SSLV ( alpha0, beta0, gamma0, eta0, F0, E0, n1, Et, Ft);
out3 = dSSLV(alpha0, beta0, gamma0, eta0, F0, E0, n1, Et, Ft);

alpha = 0.9;
beta = 0.024;
gamma = 0.005;
eta = 0.25;

alpha = 0;
beta = 0.004545119;
gamma = 1.730677923;
eta = 0.481284688;

out4 = LVSOLVE(alpha,beta,gamma,eta, F0, E0, n1); 
out4(:,2) = data1(:,3); 
out4(:,3) = data1(:,2); 

scatter(data1(:,1),data1(:,3)), 
xlabel('Year'), ylabel('Hare Population Count')
title('Hare Population Count and Euler Estimates')
hold on 
plot(data1(:,1)+1,out4(:,2))
legend('Actual','Euler Model');

scatter(data1(:,1),data1(:,2)), 
xlabel('Year'), ylabel('Lynx Population Count')
title('Lynx Population Count and Euler Estimates')
hold on 
plot(data1(:,1)+1,out4(:,3))
legend('Actual','Euler Model');

