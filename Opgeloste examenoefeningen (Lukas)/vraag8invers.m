function [x] = vraag8invers(a, x0)
    if (a == 0)
       x = inf;
       return
    end

    F = @(d) d.*(2-d*a);
    steps = 14/2+1;
    
    x = x0;
    for i = 1:steps
        newX = F(x(i));
        x = [x newX];
    end