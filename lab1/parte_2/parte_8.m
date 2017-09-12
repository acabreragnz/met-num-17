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

[x, p, H] = ord_cuthill_cholesky(A, b);

% % solucion exacta
x_octave = A(p, p) \ b(p);

spy(H);
