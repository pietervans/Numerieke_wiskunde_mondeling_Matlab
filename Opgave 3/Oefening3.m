hold on; 


%Lijst aanmaken op het gevraagd domein
x = linspace(-5,5,100);

%Plotten van de functie adhv mijnf(x)
plot(x, mijnf(x));
    
    %BIJ HET EVALUEREN MOET WORDEN REKENING GEHOUDEN MET STABILITEIT, ZIE
    %FUNCTIE MIJNF.M EN CURSUSBLAD
            
%Limiet plaatsen op de y-as van de grafiek (overzichtelijker)
ylim([-10,10]);

%Berekenen van absolute en relatieve conditie, zie cursusblad
conditieAbs =  abs((x.^2+4*x+1)./((x+2).^2));
conditieRel = (conditieAbs.*abs(x))./(abs(mijnf(x)));

%Plotten van relatieve of absolute conditie
plot(x,conditieRel,'g') %Groot voor x rond -1,1 en 2 (zie cursusblad)

%plot een rechte op x=-1 en x=1 (nulpunten die geen asymptoot zijn)
line([-1,-1],[-10,10],'Color','r')
line([1,1],[-10,10],'Color','r')


