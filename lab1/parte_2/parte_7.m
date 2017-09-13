more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../algoritmos'));

sistema = load('./../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

% A = [29 34 -10; 34 41 -12; -10 -12 24];
% b = [1; 2; 3];

do_reverse = true;

[x, p, H] = ord_cuthill_cholesky(A, b, do_reverse);

% % solucion exacta
x_octave = A(p, p) \ b(p);

error_relativo = norm(x_octave - x);

spy(H);
