%vraag1: zie mijnf.m
%(x-2) uit teller en noemer weggedeeld waardoor er minder bewerkingen zijn
% -> minder afrondingsfouten

% absolute waarde plots (zie foto)
syms x
x1 = linspace(-5,5,100);
f1(x) = (abs(x^2-1) +x^2);
plot(x1,f1(x1), 'r');
hold on

f2(x) = (abs(x^2-1)*3);
plot(x1,f2(x1),'b');
hold on

%relatieve waarde plots
f3(x) = (x^2/abs(x^2-1)+1);
plot(x1,f3(x1),'g');
hold on

line([-5,5],[3,3])
hold off

% zie ook pagina 36
% conclusie : (x^2-1) is numeriek stabieler dan (x-1)(x+1)
% behalve ongeveer tijdens het interval van [-sqrt(2),-sqrt(2/3)]U[sqrt(2/3),sqrt(2)], dan is 
% (x-1)(x+1) stabieler dan (x^2-1). Dit komt om dat de relatieve fout van
% (x-1)(x+1) begrensd is door 3 terwijl de andere door deling door een heel
% klein getal naar oneindig gaat. 

% vraag 2 
f4 = @(x) mijnf2(x);
y4 = arrayfun(f4,x1);
plot(x1,y4);
ylim([-10,10]);
hold on
line([-5,5],[0,0])
hold off


%vraag 3 
% de conditie is het best waar de abs van de afgeleide -> 1 gaat 


%vraag 4 zie vraag 1 + foto 

% vraag 5
plot(x1,y4);
ylim([-10,10]);
hold on
line([-5,5],[0,0], 'color','red')

% De conditie van het 1e nulpunt rond x = -1 is vrij goed die van x=1 is 
% daarentegen redelijk slecht voor meer uitleg zie pagina 239



