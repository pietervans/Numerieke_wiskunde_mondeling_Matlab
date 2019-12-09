x = linspace(-5,5,100);

plot(x, mijnf(x));
ylim([-10,10]);

conditieAbs = abs((x.^2+4*x+1)./((x+2).^2));
conditieRel = (conditieAbs.*x)./(mijnf(x));

hold on
plot(x, conditieAbs, 'r');


