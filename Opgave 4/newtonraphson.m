function ws = newtonraphson(f,df,start,tol)
%     default = 10^(-6);
    ws(1,1) = start;
    max = 1000;
    iteraties = 0;
    for k = 1:max
        
        % nieuw nulpunt bepalen
        g = f(ws(k,1));
        h = df(ws(k,1));
        ws(k+1,1) = ws(k,1) - g/h;
        
        % fout berekenen
        fout(k,1) = (abs(ws(k+1,1)-ws(k,1)))/abs(ws(k+1,1)); % moet eigenlijk (ws(k+1,1)-x*)/x* zijn maar x* niet gekend
        
        
        iteraties = iteraties + 1;
        if abs(ws(k+1,1)-ws(k,1)) < tol
            break
        end
    end
    plot(1:iteraties,fout);
end


% De convergentie gebeurt zeer snel, respecievelijk 4 en 5 iteraties. 
% De relatieve fouten verschillen sterk van de startwaarde. Bij startwaarde 7 zijn de
% relatieve fouten klein omdat de afgeleide groot is en dus een nulpunt dicht bij 7´
% wordt gezocht. Bij startwaarde 2 is de afgeleid zeer klein waardoor we een grote
% relatieve fout hebben. We vinden een nulpunt -7pi. De conditie van het
% probleem is namelijk bepaald door de afgeleide van f rond het nulpunt.
% Indien de afgeleide rond het nulpunt groot is, is de conditie goed.


