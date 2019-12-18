function x1 = newtonraphsonpoly(x0, f)

f2 = diff(f);
x = x0;
x1 = x0 - subs(f)/subs(f2);
k = 1;

while k<10 && abs(x1-x0)>8*eps(double(abs(x1))) % abs berekent norm
x0 = x1;
x = x0;
x1 = double(x0 - subs(f)/subs(f2)); % zonder double wordt er symbolisch gerekend
k = k + 1;
end

end