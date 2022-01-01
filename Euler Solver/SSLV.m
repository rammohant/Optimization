function out2 = SSLV ( alpha0, beta0, gamma0, eta0, F0, E0, n1, Et, Ft) 
    %Et = data1(:,2); 
    %Ft = data1(:,3); 

    out1 = LVSOLVE ( alpha0, beta0, gamma0, eta0, F0, E0, n1); 
    
    % Least squares calculation
    SS1 = sum( ( out1(:,1) - Ft ).^2 ) + sum( ( out1(:,2) - Et ).^2 );
    
    % hard boundaries/barrier function 
    % need it to be 0 until constant activates
    SS1 = SS1 + max( 0.0000001, 1/(alpha0-0.00000001)^0.1 ); 
    SS1 = SS1 + max( 0.0000001, 1/(beta0-0.00000001)^0.1 ); 
    SS1 = SS1 + max( 0.0000001, 1/(gamma0-0.00000001)^0.1 ); 
    SS1 = SS1 + max( 0.0000001, 1/(eta0-0.00000001)^0.1 ); 
  
    out2 = SS1; 
  
end