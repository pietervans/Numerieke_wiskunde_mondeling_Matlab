function [ x ] = linstelsel( A,b ,X ,Kmax,e, m)
%lost het stelsel Ab = X op met X een gekozen startwaarde en m de methode:
%m = j of g
[r,k]=size(A);
if r~=k
    disp('A moet vierkante matrix zijn');
    return
end
L = tril(A,-1);
R = triu(A,1);
D = A-L-R
B = inv(D)*(L+R);
jacobiwaarde=norm(B)
if jacobiwaarde>=1
    disp('jacobi methode convergeert niet');
end

H=inv(L+D)*R;
gausswaarde=norm(H)
if gausswaarde>=1
    disp('gauss-seidel methode convergeert niet');
    return
end

%nauwkeurigheid van Jacobi
[xj fkj] = jacobi(A,b,X,Kmax, e);
%met x de oplossing volgens jacobi en fk1 de fouten op x1 voor k
[xg fkg] = gauss_Seidel(A,b,X,Kmax,e);
kj = [1:length(fkj)]
kg = [1:length(fkg)]

% Top plot
nexttile
plot(kj,fkj)
title('Nauwkeurigheid bij Jacobi')

% Bottom plot
nexttile
plot(kg,fkg)
title('Nauwkeurigheid bij Gauss-Seidel')

if m == 'j'
    x = xj
else
    x = xg

end
