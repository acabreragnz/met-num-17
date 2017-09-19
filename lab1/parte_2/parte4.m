sistema = load('./../sistemas_reales/nasa1824');
addpath(genpath('./../algoritmos'));

A = sistema.Problem.A;
b = sistema.Problem.b;

x_inicial = zeros(length(b), 1);

gauss_seidel(A, b, x_inicial, 100, 0.1)
