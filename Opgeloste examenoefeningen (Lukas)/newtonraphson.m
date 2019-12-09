function [ws] = newtonraphson(f,df,start, tol)
    if ~exist('tol', 'var')
        tol = 1e-6;
    end
    
    Kmax = 100;
    x = start;
    ws = [];
    for i=1:Kmax
       f0 = f(x);
       df0 = df(x);
       
       xPrev = x;
       x = xPrev-f0/df0;
       ws = [ws x];
       
       if abs(x-xPrev) < tol
          break 
       end
    end

end