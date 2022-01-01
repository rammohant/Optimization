function res1 = tx1 ( x1 ) % x is a vector 
    x12 = x1(1);
    x13 = x1(2); 
    x23 = x1(3); 
    x24 = x1(4); 
    x34 = x1(5); 
    res1a = ( 5 + 0.1*x12 /( 1 - 0.1*x12 ) )*x12; 
    res1a = res1a + ( x13 / ( 1 - x13/30 ) )*x13; 
    res1a = res1a + ( 1 + x23 / (1 - 0.1*x23) )*x23; 
    res1a = res1a + ( x24 / ( 1 - (x24/30) ) ) *x24; 
    res1a = res1a + ( 5 + x34 / (1 - (x34/30) ) ) *34; 
    res1 = res1a; 
end 
