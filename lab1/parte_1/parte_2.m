more off;
clear;
format long;

% Resolver el sistema Ax = b mediante escalerizaci ́on Gaussiana junto con
% sustitucion hacia atras. Reportar matriz triangular superior, solucion y tiempo
% de ejecucion.

addpath(genpath('./../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];
b = [1; 2; 3];

main_tic = tic()

tic()
[H, L, v] = eg(A,b);
H
toc()

tic()
x = sustitucion_hacia_atras(H, v)
toc()

toc(main_tic)
