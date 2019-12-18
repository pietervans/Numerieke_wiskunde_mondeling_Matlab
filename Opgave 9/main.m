function main
    syms x;
    f = x^6 +1;
    n = 6;
    x0 = 1 + 1i;
    wortels = newtonraphsondeflate(f,n,x0);
    hold on
    for i = 1:size(wortels,2)
        getal = wortels(1,i);
        x_as(i,1) = real(getal);
        y_as(i,1) = imag(getal);
    end
    plot(x_as,y_as,'o')
end