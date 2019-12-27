function output = oefening10    
    fun = @(x) sin(x).*x;
    integraal = integral(fun,0,5);
    benadering = autosimp(0,5,@f,10,0.000001);
    error = abs(benadering - integraal)/abs(integraal);
    output = error;
end