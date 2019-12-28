function[L, U, P] = croutfactors(A)
[C, ind] = my_crout(A)
L = tril(C) %tril = triangular lower matrix (benedendriehoeksmatrix)
U = triu(C)
dimension = size(C) 
n = dimension(1);
m = dimension(2);
for i = 1:n
    U(i,i) = 1;
end
P = zeros(n,n); %initialiseer een lege n*n matrix
for i = 1:n 
    P(i,ind(i)) = 1 %overloop elke rij en zit een 1 op een bij de kolomindex i die overeenkomt met waar rij-index i naar toe is verwisseld 
end

end


    
