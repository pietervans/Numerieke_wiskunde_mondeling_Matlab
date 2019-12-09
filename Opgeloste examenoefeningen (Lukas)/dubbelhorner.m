function [output, V, O, steps] = dubbelhorner(a, x)
    b = [0, a(1)];
    rho = 2*real(x);
    mu = -(real(x)^2 + imag(x)^2);
    n = length(a)-1;
    
    V = 3;
    O = 1;
    steps = 1;
    
    for k=1:n %opgelet hier is n = n+1 van nota's
        newB = a(k+1) + rho*b(k+1) + mu*b(k);
        V = V + 2;
        O = O + 2;
        b = [b, newB];
        steps = steps+1
    end
    
    A = b(n+2) - real(x)*b(n+1);
    B = imag(x)*b(n+1);
    output = A + B*1i;
    
    O = O + 2;
    V = V + 3;
end