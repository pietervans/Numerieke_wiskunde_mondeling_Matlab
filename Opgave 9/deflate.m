function q = deflate(p, x1)
n = length(p)-1;
q = zeros(1, n);
q(1) = p(1);
for i = 2:n
   q(i) = x1*q(i-1) + p(i); 
end
end