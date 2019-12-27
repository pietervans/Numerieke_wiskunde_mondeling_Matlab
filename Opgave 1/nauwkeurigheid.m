function nauwkeurigheid(a, b)
x = 0.1;
y = a * x;
if y == b
% if y - b < eps(a) --> aanpassing; foutmarge inlassen
    disp("y is gelijk aan b");
else
    disp("y is niet gelijk aan b");
end
end


% 3) enkel 0.5 kan met een eindig aantal binaire getallen worden voorgesteld,
% de andere kommagetallen niet

% 4) zie slechte foto

% 5) geen idee

% 6) regel 4 vervangen door abs(y-b) <= 0.1*(abs(a)+abs(b))*eps
% eps = machinenauwkeurigheid