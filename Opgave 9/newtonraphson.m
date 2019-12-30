function ws = newtonraphson(f, df, start, tol)

switch nargin
    case 3
        tol = 10^-6;
end

x0 = start;
x1 = start - f(start)/df(start);
k = 1;
K = 20;
ws = zeros(1, K);
ws(1) = x1;
while k<20 && abs(x1 - x0) > tol
    x0 = x1;
    x1 = x0 - f(x0)/df(x0);
    k = k+1;
    ws(k) = x1;
end

hold on
plot([1 k+1],[0 0], 'r')
ws = ws(1:find(ws, 1, 'last'));
appr_sol = ws(length(ws));
ws = (ws-appr_sol)/appr_sol;
plot(1:length(ws), ws)
end