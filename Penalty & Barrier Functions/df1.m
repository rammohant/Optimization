function f1 = df1(x1,x2)
    res1 = (-2*pi/9)*sin(2*pi*x1/9)*sin(2*pi*x2/7)*exp(-(x1+x2)^2);
    res1= res1 + cos(2*pi*x1/9)*sin(2*pi*x2/7)*exp(-(x1+x2)^2)*(-2*(x1+x2));
    
    res2 = cos(2*pi*x1/9)*exp(-(x1+x2)^2)*(2*pi/7)*cos(2*pi*x2/7);
    res2 = res2 + cos(2*pi*x1/9)*exp(-(x1+x2)^2)*sin(2*pi*x2/7)*(-2*(x1+x2));
    
    f1 = [res1; res2;]
end