function [C, ind] = my_crout(C)
    si = size(C);
    ind = 1:si(1);
    for i = 1:si(1)
        k = i;
        s = 0;
        
        for j = i:si(1)
            C(j,i) = C(j,i) - C(j,1:(i-1))*C(1:(i-1),i);
            if abs(C(j,i)) > s
               k = j;
               s = abs(C(j,i));
            end 
        end
        
        if s == 0
            return %niet inverteerbaar
        end
        
        if k ~= i
           tempRow = C(k,:);
           C(k,:) = C(i,:);
           C(i,:) = tempRow;
           tempRowNum = ind(k);
           ind(k) = ind(i)
           ind(i) = tempRowNum;
        end
        
        for j=i+1:si(2)
           C(i,j) = (C(i,j) - C(i,1:i-1)*C(1:i-1,j))/C(i,i);
        end
    end
end