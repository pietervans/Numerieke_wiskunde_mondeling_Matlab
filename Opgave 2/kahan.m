% 1. van klein naar groot optellen is optimaal, omgekeerd bijlange niet.
%    Het probleem is dat er veel verlies is van precisie als je een klein
%    getal bij een groot getal optelt.
% 2. Op de figuur gaat een deel van Y verloren (nl. Y_l)
%    Het algoritme tracht bij te houden wat er precies verloren gaat en
%    corrigeert navenant bij het optellen van het volgende getal;
% 4. We vergelijken ongeordende sommatie met kahan:
%   A = zeros(1, 9999);
%   A = A + eps/2;
%   A(1) = 1;
%   kahan(A) --> 1.000000000001110
%   summation(A) --> 1
%   Bij summation gaat eps/2 steeds verloren door afronding.
%   Door de correctieterm in het
%   kahanalgoritme blijft de kleine term eps/2 wel behouden.

%   Beter voorbeeld:
%   A = [1, eps/2, -1];
%   kahan(A) --> eps/2;
%   summation(A) --> 0;

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