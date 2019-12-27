function sol = solveLU(n, range)
    %lost een willekeurig stelsel van n vergelijkingen en n onbekenden op via Crout, de coëfficienten gaan van 0 tot range
    stelsel = round(rand(n,(n+1))*range)
    disp(stelsel)
    [L, U, P] = croutfactors(stelsel)
    B = stelsel(:,(n+1))
    stelsel(:,(n+1)) = []
    C = stelsel
    X = cell(n,1) %kolommatrix van de n onbekenden
    %C*X = B
    %PC*X = P*B
    %L*U*X = P*B, stel Y = U*X
    %L*Y =P*B en zoek Y via voorwaardse substitutie
    %U*X = Y en zoek X via achterwaardse substitutie
    B = P*B
    %voorwaardse substitiutie voor L*Y = B
    Y = cell(n,1)
    Y(1,1) = B(1,1)/L(1,1)
    for i = 2:n
        teller = B(i,1)
        for j = 1:(i-1)
            teller = teller -L(i,j)*Y(j,1)
        end
        Y(i,1) = teller/L(i,i)
    end

    %U*X = Y en zoek X via achterwaardse substitutie
    X(n,1) = Y(n,1)
    for i = (n-1):-1:1 %van n-1 naar 1 met stappengrootte -1
        X(i,1) = Y(i,1)
        for j = n:-1:n-(i+1)
            X(i,1) = X(i,1) -U(i,j)*X(j,1)
        end 
end

sol = X