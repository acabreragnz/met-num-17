more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../algoritmos'));

sistema = load('./../sistemas_reales/contenedores');
A = sistema.Problem.A;
b = sistema.Problem.b;

% A = [29 34 -10; 34 41 -12; -10 -12 24];
% b = [1; 2; 3];

do_reverse = false;

[x, p, H] = ord_cuthill_cholesky(A, b, do_reverse);
[x_chol, H_chol] = chol_sust(A, b);

A_permutada = A(p, p);

fprintf('Ancho de banda matriz original\n')
[k1,k2] = bandwidth(A);
abs(max(k1,k2))

fprintf('Ancho de banda matriz permutada\n')
[k1,k2] = bandwidth(A_permutada);
abs(max(k1,k2))

fprintf('Cantidad de no ceros matriz original chol\n')
nnz(H_chol)

fprintf('Cantidad de no ceros de matriz permutada chol\n')
nnz(H)

fprintf('Cantidad de no ceros nuevos\n')
nnz(H) - nnz(chol(A))

% % solucion exacta
x_octave_perm = A_permutada \ b(p);
x_octave = A \ b;

fprintf('Error absoluto matriz permutada\n')
norm(x_octave_perm - x)

fprintf('Error absoluto matriz original\n')
norm(x_octave - x_chol)

% spy(H);
