function [f] = mijnf(x)
    f = x.^2
    f = f-1
    f = f./(x+2)
end