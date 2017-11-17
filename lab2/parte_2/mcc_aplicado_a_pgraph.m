more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

N = 100;
lejania_extremos = 0.0025;

fprintf('Calculando medida de rendimiento mcc para p5 \n')
F_p5 = F_p_graph(length(p5));
[c_newton_p5, x_newton_p5] = mcc(p5, N, lejania_extremos);
mrp5 = medida_rendimiento_mcc(F_p5, c_newton_p5, x_newton_p5)

% fprintf('Calculando medida de rendimiento mcc para p10 \n')
% F_p10 = F_p_graph(length(p10));
% [c_newton_p10, x_newton_p10] = mcc(p10, N, lejania_extremos);
% mrp50 = medida_rendimiento_mcc(F_p10, c_newton_p10, x_newton_p10)
%
% fprintf('Calculando medida de rendimiento mcc para p50 \n')
% F_p50 = F_p_graph(length(p50));
% [c_newton_p50, x_newton_p50] = mcc(p50, N, lejania_extremos);
% mrp50 = medida_rendimiento_mcc(F_p50, c_newton_p50, x_newton_p50)
