function output = autosimp(a,b,f,K,fout)
    h = (b-a)/2;
    So = f((b+a)/2);
    I = h/3*(f(a) + f(b) + 4*So);
    k = 0;
    S = 5*So;
    xx = [h];
    yy = [error(I)];
    while k<K & abs(S-So)>fout
        h = h/2;
        S = So;
        So = 0;
        for j=1:2^(k+1)
            x = a + (2*j-1)*h;
            So = So + f(x);
        end
        I = 0.5*I + h/3*(4*So - 2*S);
        xx(k+2) = h;
        yy(k+2) = error(I);
        k = k+1;
        disp(k);
    end
    plot(xx,yy)
    output = I;
end




% 2) verklaring stopcriterium: wanneer het verschil tussen twee opeenvolgende
% benaderingen heel klein is, zal de benadering dus convergeren naar dat
% getal. In dat geval is het dus niet meer nodig om verder te itereren.

function output = error(I)
    fun = @(x) sin(x).*x;
    integraal = integral(fun,0,5);
    benadering = I;
    error = abs(benadering - integraal)/abs(benadering);
    output = error;
end

% 4) de relatieve fout daalt zeer snel bij halvering van de pas


