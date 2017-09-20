more off;
clear;
format long;

% cargo los algoritmos
addpath(genpath('./../algoritmos'));

sistema = load('./../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

main_tic = tic()

tic()
[H, L, v] = eg(A,b);
toc()

tic()
x = sustitucion_hacia_atras(H, v);
toc()
x(1:5)

toc(main_tic)
spy(H)
