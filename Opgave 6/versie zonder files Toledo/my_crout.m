function[C, ind] = my_crout(C)
dimension = size(C) 
n = dimension(1)
m = dimension(2)
ind = 1:n %vector met all rijnummers in, bij een rijwissel worden hier de overneekomstige nummers ook gewisseld
for i = 1:n
    k = i
    s = 0
    for j = i:n
        C(j,i) = C(j,i) - C(j,1:(i-1))*C(1:(i-1),i); %berekenen entries van L (onder de diagonaal)
        if abs(C(j,i)) > s %element dat in absolute waarde het grootst is, willen we gebruiken als pivotelement
            s = abs(C(j,i)) 
            k = j %in deze situatie is er dus een groter pivotelement --> straks rij omwisselen
        end
    end
    if s == 0
        return %niet inverteerbaar
    end
    if k ~= i %rij i en k omwisselen
        Ri = C(i,1:end)
        C(i,1:end) = C(k, 1:end) %Ri wordt Rk
        C(k, 1:end) = Ri %Rk wordt Ri
        ind(:,[i,k]) = ind(:,[k,i]) %omwisseling wordt bijgehouden in 'ind' vector
        
    end 
    for j = i+1:m
        C(i,j) = (C(i,j)- C(i,1:(i-1))*C(1:(i-1),j))/C(i,i); %bereken entries van R (boven de diagonaal)
    end
end
        
       
     


