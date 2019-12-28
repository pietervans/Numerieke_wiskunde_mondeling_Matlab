function [Y, fouten]  = jacobi(A,B,X,Kmax,e) 
% JACOBI lost het lineaire stelsel A*X = B 
% op met een maximum aan Kmax iteraties 
% en een precisie e

n = size(A,1); %aantal rijen in A
Y = zeros(n,1);

%beginnen met een gok voor de oplossing, namelijk X
%houden een lijst met fouten bij voor eerste element uit X, kan handig zijn om de nauwkeurigheid te
%analysren
fouten = [0]
for k = 1:Kmax %veilig stopcriterium
    for j = 1:n 
        Y(j) = X(j) - (A(j,:)*X-B(j))/A(j,j); %totale stap, J = A
    end
    fout = abs(X-Y);
    fouten(k) = fout(1);
    if fout < e %convergentie-stopcriterium
        return 
    end
    X = Y;
    
end