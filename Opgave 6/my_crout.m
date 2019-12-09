function[C, ind] = my_crout(C)
dim = size(C) 
n = dim(1)
m = dim(2)
ind = 1:n %vector met all rijnummers in, bij een rijwissel worden hier de overneekomstige nummers ook gewisseld
for i = 1:n
    k = i
    s = 0
    for j = i:n
        C(j,i) = C(j,i) - C(j,1:(i-1)).*C(1:(i-1),i);
        if abs(C(j,i)) > s
            s = abs(C(j,i))
            k = j
        end
    end
    if s == 0
        return 
    end
    if k ~= i
        Ri = C(i,1:end)
        Rk = C(k, 1:end)
        C(i,1:end) = Rk
        C(k, 1:end) = Ri
        ind(:,[i,k]) = ind(:,[k,i])
        
    end 
    for j = i+1:m
        C(i,j) = (C(i,j)- C(i,1:(i-1)).*C(1:(i-1),j))/C(i,i)
    end
end
        
       
     


