%Ik heb dit niet gebruikt, wtf is jgs.mat zelf?

% We laden het probleem
% hieruit krijgen we de matrix A, het rechterlid b en de startwaarde x0
load jgs.mat

% We halen D, L en U uit de matirx A
D = diag(diag(A));
L = tril(A,-1);
U = triu(A, 1);

% Initalisatie van de het stopcriterium
Kmax = 50;

% Initialisatie van de startvector
x_jacobi = x0;
x_gauss = x0;

% Geheugen voorzien voor de fout in elke stap
rel_fout_jacobi = zeros(1,Kmax);
rel_fout_gauss = rel_fout_jacobi;

% Iteratief oplossen ven hat stelsel
for k = 1:Kmax

  x_jacobi = D\(-(L+U)*x_jacobi+b); % iteratievoorschrift Jacobi
  x_gauss = (L+D)\(-U*x_gauss+b); % iteratievoorschrift Gauss-seidel
  
  % bereken de fout ven het resultaat bekomen in deze stap
  rel_fout_jacobi(k) = norm(x_jacobi-x_exact)/norm(x_exact);
  rel_fout_gauss(k) = norm(x_gauss-x_exact)/norm(x_exact);

end