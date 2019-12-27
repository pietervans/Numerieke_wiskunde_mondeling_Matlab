function [output, V, O, steps] = dubbelhorner(a, x)
    b = [0,0,a(1)]; %eerst b_-2 en b_-1 gelijkstellen aan nul
    
    %rho en mu bepalen
    rho = 2*real(x);
    mu = -(imag(x)^2+real(x)^2);
    
    %n = graad van de veelterm+1
    n = length(a);
    
    %Optellingen (O) en vermenigvuldigingen (V) bijhouden
    O = 1;  
    V = 2; 
    steps = 1;
    
    %itereren met aangepaste formule
    for k = 2:n   
        b(k+2) = a(k) + rho*b(k+1)+mu*b(k);
        O = O+2;
        V = V+2;
        steps = steps+1;
    end
    
    %Reeel en imaginair deel bepalen adhv laatste 2 waarden
    A = b(n+2) - real(x)*b(n+1);
    B = imag(x)*b(n+1);
    O = O+1;
    V = V+2;
    %output van complex getal
    output = A+B*1i;
    Complexiteit = [V,O]
    steps
    
    % controle
    waarde = polyval(a,x);
    rel_error = abs(waarde-output)/abs(waarde)
    
    
end