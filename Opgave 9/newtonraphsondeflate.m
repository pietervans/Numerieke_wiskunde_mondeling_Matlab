function sol = newtonraphsondeflate(X0, p)
n = length(p) - 1;
sol = zeros(1,n);
if length(X0) < n
    disp('not enough guesses')
end
for i = 1:n
    x1 = newtonraphsonpoly(p, X0(i));
    p = deflate(p, x1);
    sol(i) = x1;
end
scatter(real(sol), imag(sol), 'ro', 'filled');
xlim([-1.2, 1.2]);
ylim([-1.2, 1.2]);
end