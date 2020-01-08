function [eval, optellingen, vermenigvuldigingen] = dubbelhorner(p,c,d)

% p(x) is de polynoom
% als je het algoritme zelf wilt testen, gebruik 'syms x' in je command
% window om aan te geven dat x een variabele is en typ dan gewoon 'p(x) =
% ... ', anders werkt 'coeffs' niet.

% c+di is het complex getal waarin de functie geëvalueerd wordt.

a = coeffs(p,'All'); % coeffs geeft een uitdrukking (GEEN vector) terug met de coëfficiënten bij oplopende graad, 'All' zorgt ervoor dat ook de coëfficiënten '0' worden teruggegeven
a = a(1); % hier mag je een random getal invullen om een vector te verkrijgen

n = length(a)-1; % -1 aangezien de graad van de constante term 0 is

b = zeros(1,n+2);
b(1) = 0;
b(2) = a(1);

rho = 2*c;
mu = -(c^2 + d^2);

optellingen = 1; % afkomstig van mu
vermenigvuldigingen = 3; % 1 van rho en 2 van mu (de kwadraten)

for k = 3:n+2
    b(k) = a(k-1) + rho*b(k-1) + mu*b(k-2); % a(k-1) ipv a(k) omdat de 'a_0' index 1 heeft
    optellingen = optellingen + 2;
    vermenigvuldigingen = vermenigvuldigingen + 2;
end 

C = b(n+2) - c*b(n+1);
D = d*b(n+1);

optellingen = optellingen + 1;
vermenigvuldigingen = vermenigvuldigingen + 2;

eval = C + D*1i; % 1i ipv i, suggestie door matlab om het 'robuuster' te maken

end 
