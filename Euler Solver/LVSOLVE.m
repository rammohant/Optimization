function out1 = LVSOLVE(alpha, beta, gamma, eta, F0, E0, t) 
    data1 = readmatrix("LynxHare.txt");
    %t = size (data1, 1); 
    Year = data1(:,1) + 1; 
    Fout1 = zeros(t,1); 
    Eout1 = zeros(t,1); 
    for i = 1:t
        F0h = F0; % Hare
        E0h = E0; % Lynx
        E0 = E0h + (gamma*F0h*E0h) - eta*E0h; % Lynx
        F0 = F0h + alpha*F0h - (beta*F0h*E0h); % Hare
        % delta t (time step) = 1, so we can ignore it
        Fout1(i,1) = F0; % Hare  
        Eout1(i,1) = E0; % Lynx
    end
    out1 = [Year Fout1 Eout1]; 
end

% alpha = 0.1
% beta = 0.005 
% gamma = 0.00004 
% eta = 0.04
