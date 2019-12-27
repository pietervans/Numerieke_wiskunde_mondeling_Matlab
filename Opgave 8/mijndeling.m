% 1. F(x) = 2*x - a*x^2
% 3. Methode is consistent. Reciprook consistent?
% 4. Convergentie naar correcte waarde 1/a asa x behoort tot ]0, 2/a[
% Opmerking ]2/a, 0[ als a negatief is
% 5. Als de startwaarde != 0, dan divergeert de reeks. Zoniet, dan is het
% resultaat 0
% 7. Theoretisch verwachte convergentie?


function a_inverse = mijndeling(a)
negative = false;
if a == 0
   fprintf("Can't compute the inverse of 0.\n");
   return
end

% Deelvraag 2
xx = linspace(0, .3, 100);
yy = zeros(1, 100);
for i = 1:length(xx)
    yy(i) = F(a, xx(i));
end
plot(xx,yy)
hold on
plot(xx, xx)
hold off


x = .1;
a_inverse = F(a, x);
k = 0;
Kmax = 100;
convergentiereeks = zeros(1, Kmax+1);
convergentiereeks(1) = a_inverse;
while and(abs(a_inverse - 1/a) > 0.5*10^(-14), k<Kmax)
   x = a_inverse;
   a_inverse = F(a, x);
   convergentiereeks(k+2) = a_inverse;
   k = k+1;
end

% Deelvraag 7
% Trailing zeros elimineren; we zoeken index laatste != 0 element
index = find(convergentiereeks, 1, 'last');
plot(1:index, convergentiereeks(1:index)-1/7)
hold on
scatter(1:index, convergentiereeks(1:index)-1/7, 'ro', 'filled')
hold off

end