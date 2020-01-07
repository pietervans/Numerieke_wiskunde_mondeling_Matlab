function ws = newtonraphson(f, df, start, tol)

%controleren of de variabele tol is meegegeven
 if ~exist('tol','var')
      %geen waarde voor tol meegegeven dus geven we het de default waarde
      tol = 10^(-6);
 end

Kmax = 100; %veilig stopcriterium 
ws = zeros(1,Kmax); %lijst met Kmax nullen in die we dan gaan vervangen door de gevonden benaderingen voor het nulpunt

ws(1) = start; %1e benadering = startwaarde
ws(2) = ws(1) - f(ws(1))/df(ws(1)); %formule Newton Raphson
k = 2;


while abs(ws(k)-ws(k-1)) > tol %zolang de fout tussen 2 opeenvolgende benaderingen groter is dan de tolerantie blijven we itereren
    if k < Kmax %voorkomen dat we in een oneindige lus terechtkomen
        ws(k+1)= ws(k) - f(ws(k))/df(ws(k));
        k = k + 1;
    else 
        break
    end
end

i = k+1;
%overbodige nullen verwijderen
while i <= Kmax
     ws(i) = [];
     Kmax = Kmax -1; 
end

x_exact = ws(k); %we gebruiken de gevonden benadering die voldoet aan de gewenste tolerantie
%                   als bendaring voor het exacte nulpunt
fouten = zeros(1,k); %lijst met nullen om hier later de relatieve fouten in te zetten

for i = 1:k
    fouten(i) = (ws(i)-x_exact)/x_exact; %relatieve fout op elke benadering bepalen. 
end
index = 1:1:k; %lijst met indices van 1 tot k
plot(index,fouten, 'r-*')
xlabel('index')
ylabel('relatieve fout')
title('relatieve fout' ,'FontSize',12)




