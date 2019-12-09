function [S] = kahan(a, Y)
    %% vb: 2*eps^-1 + 1 - 2*eps^-1 % 2*eps^-1, want zo 1 bit hoger dan afronding ofzo (onderscheiding tot op basis 2)

    S = a(1); %eerste getal
    C = 0; %correctieterm
    for j=2:length(a)
        Y = a(j) - C; %het kleine getal wordt gecorrigeert met de correctieterm van vorige iteratie
        T = S + Y; %we nemen de som
        C = (T - S) - Y; %we berekenen de fout op de somterm
        S = T; %nieuwe som is resultaat van deze iteratie
    end

end
