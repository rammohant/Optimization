function out3 = dSSLV(alpha0, beta0, gamma0, eta0, F0, E0, n1, Et, Ft)
    h1 = 0.00000001 % has to be really small because of how small the 'a' was in SSLV
    dSSa = (SSLV(alpha0 + h1, beta0, gamma0, eta0, F0, E0, n1, Et, Ft) - SSLV(alpha0 - h1, beta0, gamma0, eta0, F0, E0, n1, Et, Ft) ) / (2*h1);
    dSSb = (SSLV(alpha0, beta0 + h1, gamma0, eta0, F0, E0, n1, Et, Ft) - SSLV(alpha0, beta0 - h1, gamma0, eta0, F0, E0, n1, Et, Ft) ) / (2*h1);
    dSSg = (SSLV(alpha0, beta0, gamma0 + h1, eta0, F0, E0, n1, Et, Ft) - SSLV(alpha0, beta0, gamma0 - h1, eta0, F0, E0, n1, Et, Ft) ) / (2*h1);
    dSSe = (SSLV(alpha0, beta0, gamma0, eta0 + h1, F0, E0, n1, Et, Ft) - SSLV(alpha0, beta0, gamma0, eta0 - h1, F0, E0, n1, Et, Ft) ) / (2*h1);
    out3 = [dSSa; dSSb; dSSg; dSSe]; 
end