function [L, U, P] = croutfactors(C, ind)
    %% we bepalen de matrix P
    si = size(C)
    P = zeros(si(1), si(1));
    for i = 1:si(1)
        P(i, ind(i)) = 1;
    end
    
    L = tril(C);
    L = L(1:si(1),1:si(1));
    U = triu(C) - eye(si(1), si(2)).*diag(C); % maar elementen op diag zijn 1
    
    for i=1:si(1)
       U(i,i) = 1; 
    end
    