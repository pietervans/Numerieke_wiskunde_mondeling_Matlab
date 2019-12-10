% functie f (symbolisch), aantal te zoeken nulptn. n, startwaarde x0
% invoer:
% syms x; f = x^6 + 1; newtonraphsondeflate(f, 6, 1 + 1i)

function x_intercepts = newtonraphsondeflate(f, n, x0)
syms x
x_intercepts = zeros(1, n);
for i = 1:n
  x1 = newtonraphsonpoly(x0, f);
  f = f/(x-x1);
  x_intercepts(i) = x1;  
end
end