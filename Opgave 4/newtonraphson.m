function ws = newtonraphson(f,df,start,tol)
    default = 10^(-6);
%     for argidx = 1:1:nargin
%         switch varargout{argidx}
%         end
    ws(1,1) = start;
    max = 1000;
    iteraties = 0;
    for k = 1:max
        g = f(ws(k,1));
        h = df(ws(k,1));
        ws(k+1,1) = ws(k,1) - g/h;
        fout(k,1) = (abs(ws(k+1,1)-ws(k,1)))/abs(ws(k+1,1));
        iteraties = iteraties + 1;
        if abs(ws(k+1,1)-ws(k,1)) < tol
            break
        end
    end
    plot(1:iteraties,fout);
end


% De convergentie gebeurt zeer snel, respecievelijk 4 en 5 iteraties. De relatieve
% fouten verschillen sterk van de startwaarde. Bij startwaarde 7 zijn de
% relatieve fouten klein omdat de afgeleide groot is en dus een nulpunt dicht bij 7´
% wordt gezocht. Bij startwaarde 2 is de afgeleid zeer klein waardoor we een grote
% relatieve fout hebben. We vinden een nulpunt -7pi.


