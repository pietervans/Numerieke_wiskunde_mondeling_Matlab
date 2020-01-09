function [a] = mijnf2(z)

syms x
if abs(z)<sqrt(2/3) || abs(z)>sqrt(2)
    f(x) = (x^2-1)/(x+2);
    a = f(z);
else
    f(x) = (x+1)*(x-1)/(x+2);
    a = f(z);
end

