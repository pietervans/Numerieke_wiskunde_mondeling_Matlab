function [X, fouten] = gauss_Seidel(A,B,X,Kmax,e) 
% GAUS_SEIDEL lost het lineaire stelsel A*X = B 
% op met een maximum aan Kmax iteraties 
% en een precisie e


n = size(A,1); 
X1 = X;

%beginnen met een gok voor de oplossing, namelijk X
%houden een lijst met fouten bij voor eerste element uit X, kan handig zijn om de nauwkeurigheid te
%analysren
fouten = [0];
for k = 1:Kmax %veilig stopcriterium
    for j = 1:n 
        X(j) = X(j) - (A(j,:)*X-B(j))/A(j,j); %merk op dat we hier (stap j) rechtsreeks in X aanpassen, dit heeft dus gevolgen op de (j+1)ste stap 
    end
    disp(X)
    fout = abs(X-X1);
    fouten(k) = fout(1);
    if fout < e %convergentie-stopcriterium
        return
    end
    X1 = X
end


