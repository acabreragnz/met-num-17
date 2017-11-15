more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

p = 1/2;
N = 1;
lejania_extremos = 1/3;

fprintf('Calculando medida de rendimiento mcc para p5 \n')
F_p5 = F_p_graph(length(c5));
medida_rendimiento_mcc(c5, F_p5, N, lejania_extremos)

fprintf('Calculando medida de rendimiento mcc para p10 \n')
F_p10 = F_p_graph(length(c10));
medida_rendimiento_mcc(c10, F_p10, N, lejania_extremos)

fprintf('Calculando medida de rendimiento mcc para p50 \n')
F_p50 = F_p_graph(length(c50));
medida_rendimiento_mcc(c50, F_p50, N, lejania_extremos)
