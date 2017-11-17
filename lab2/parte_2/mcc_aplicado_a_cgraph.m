more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

p = 1/2;
N = 10;
lejania_extremos = 1/3;

fprintf('Calculando medida de rendimiento mcc para c5 \n')
F_c5 = F_c_graph(length(c5));
[c_newton_c5, x_newton_c5] = mcc(c5, N, lejania_extremos);
mrc5 = medida_rendimiento_mcc(F_c5, c_newton_c5, x_newton_c5)

% fprintf('Calculando medida de rendimiento mcc para c10 \n')
% F_c10 = F_c_graph(length(c10));
% [c_newton_c10, x_newton_c10] = mcc(c10, N, lejania_extremos);
% mrc10 = medida_rendimiento_mcc(F_c10, c_newton_c10, x_newton_c10)
%
% fprintf('Calculando medida de rendimiento mcc para c50 \n')
% F_c50 = F_c_graph(length(c50));
% [c_newton_c50, x_newton_c50] = mcc(c50, N, lejania_extremos);
% mrc50 = medida_rendimiento_mcc(F_c50, c_newton_c50, x_newton_c50)
