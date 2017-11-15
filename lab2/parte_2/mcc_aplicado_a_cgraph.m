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
medida_rendimiento_mcc(c5, F_c5, N, lejania_extremos)

% fprintf('Calculando medida de rendimiento mcc para c10 \n')
% F_c10 = F_c_graph(length(c10));
% medida_rendimiento_mcc(c10, F_c10, N, lejania_extremos)
%
% fprintf('Calculando medida de rendimiento mcc para c50 \n')
% F_c50 = F_c_graph(length(c50));
% medida_rendimiento_mcc(c50, F_c50, N, lejania_extremos)
