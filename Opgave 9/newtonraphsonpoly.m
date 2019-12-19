function x1 = newtonraphsonpoly(p, start, tol)

    if nargin < 3
        tol = 1e-6;
    end

    x0 = inf;
    x1 = start;

    Kmax = 100;
    dp = polyder(p);
    for k=1:Kmax
        x0 = x1;
        f = polyval(p, x0);
        df = polyval(dp, x0);
        x1 = x0 - f/df;
        if(abs(x0-x1)<tol)
            return;
        end
    end

    if k >= Kmax
        x1 = NaN;%warning('no convergence');
    end
end
