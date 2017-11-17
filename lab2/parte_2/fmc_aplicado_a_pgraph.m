more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

N = 10;

fprintf('Calculando medida de rendimiento fcm para p5 \n')
F_p5 = F_p_graph(length(p5));
F_fmc_p5 = fmc(p5, N);
mrp5 = medida_rendimiento_fmc(F_p5, F_fmc_p5)

% fprintf('Calculando medida de rendimiento fcm para p10 \n')
% F_p10 = F_p_graph(length(p10));
% F_fmc_p10 = fmc(p10, N);
% mrp10 = medida_rendimiento_fmc(F_p10, F_fmc_p10)
%
% fprintf('Calculando medida de rendimiento fcm para p50 \n')
% F_p50 = F_p_graph(length(p50));
% F_fmc_p50 = fmc(p50, N);
% mrp50 = medida_rendimiento_fmc(F_p50, F_fmc_p50)
