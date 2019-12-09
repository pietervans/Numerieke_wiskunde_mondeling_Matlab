function nauwkeurigheid(a, b)
x = 0.1;
y = a * x;
if y == b
    disp("y is gelijk aan b");
else
    disp("y is niet gelijk aan b");
end
end

% probleeem bij koppel(3,0.3); andere koppels geen probleem
% 6) regel 4 vervangen door abs(y-b) <= eps(machinenauwkeurigheid)