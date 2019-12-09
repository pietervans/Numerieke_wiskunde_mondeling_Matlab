a = 2;
F = @(x) x.*(2-x*a);

x = linspace(0,1, 100);
plot(x, F(x));
hold on
plot(x,x, 'r');
%%
a = 7;
result = vraag8invers(a,0.1)-1/a;

plot(1:length(result), abs(result))
hold on
verwacht = [1];
for i = 1:length(result)-1
    newW = verwacht(i)*0.1^2;
    verwacht = [verwacht newW];
end
plot(1:length(result), verwacht, 'r');

%%set(gca, 'YScale', 'log');
