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
L_trans = chol(A); %Matriz triangular superior (H)
toc()
L = L_trans';

% Ax = b -> LL'x = b
% Ly = b    % sustitucion hacia adelante
% L'x = y   % sustitucion hacia atras

tic()
y = sustitucion_hacia_adelante(L, b);
x = sustitucion_hacia_atras(L_trans, y);
toc()

toc(main_tic)

x(1:5)
spy(L_trans)
