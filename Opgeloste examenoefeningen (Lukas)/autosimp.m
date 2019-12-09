function [I] = autosimp(f, a, b)
    h = (b-a)/2;
    S0 = f((b+a)/2);
    
    I = h/3*(f(a) + f(b) + 4*S0);
    k = 0;
    KMax = 40;
    
    tol = 1e-7;
    prev = 0;
    while k < KMax && abs(I-prev) > tol
        h = h/2;
        S = S0;
        S0 = 0;
        for j=1:2^(k+1)
            x = a + (2*j - 1)*h;
            S0 = S0 + f(x);
        end
        
        prev = I;
        I = I/2 + h/3*(4*S0 - 2*S);
        k = k+1;
    end