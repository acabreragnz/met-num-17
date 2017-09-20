more off;
clear;
format long;

% Resolver utilizando la descomposicion de Cholesky junto con sustitucion hacia
% atras y hacia adelante. Reportar matriz H (superior), solucion y tiempo de
% ejecucion.

addpath(genpath('./../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];
b = [1; 2; 3];

main_tic = tic()

tic()
L_trans = chol(A) %Matriz triangular superior (H)
toc()
L = L_trans';

% Ax = b -> LL'x = b
% Ly = b    % sustitucion hacia adelante
% L'x = y   % sustitucion hacia atras

tic()
y = sustitucion_hacia_adelante(L, b);
x = sustitucion_hacia_atras(L_trans, y)
toc()

toc(main_tic)
