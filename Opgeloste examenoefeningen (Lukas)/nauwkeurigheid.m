function [] = nauwkeurigheid (a,b)
x = 0.1;
y = a*x;
if (abs(y-b) <= eps)
disp("y is gelijk aan b")
else
disp("y is niet gelijk aan b")
end
end