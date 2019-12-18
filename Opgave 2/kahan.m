% 1. van klein naar groot optellen is optimaal, omgekeerd bijlange niet
% 2. Op de figuur gaat een deel van Y verloren (nl. Y_l)
%    Het algoritme tracht bij te houden wat er precies verloren gaat en
%    corrigeert navenant bij het optellen van het volgende getal;
% 4. Dit algoritme heeft een fout die onafhankelijk is van het aantal
%   getallen. We vergelijken ongeordende sommatie met kahan:
%   A = zeros(1, 9999);
%   A = A + eps/2;
%   A(1) = 1;
%   kahan(A) --> 1.000000000001110
%   summation(A) --> 1
%   Bij summation gaat eps/2 steeds verloren. Door de correctieterm in het
%   kahanalgoritme blijft hij wel behouden.

function S = kahan(array)
S = array(1);
C = 0;
for j = 2:length(array)
   Y = array(j) - C;
   T = S+Y;
   C = (T - S) - Y;
   S = T;
end
end