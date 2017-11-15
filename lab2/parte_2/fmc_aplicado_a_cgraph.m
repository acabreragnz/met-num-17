more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

N = 10;

fprintf('Calculando medida de rendimiento fcm para c5 \n')
F_c5 = F_c_graph(length(c5));
mrc5 = medida_rendimiento_fmc(c5, F_c5, N)

fprintf('Calculando medida de rendimiento fcm para c10 \n')
F_c10 = F_c_graph(length(c10));
mrc10 = medida_rendimiento_fmc(c10, F_c10, N)

fprintf('Calculando medida de rendimiento fcm para c50 \n')
F_c50 = F_c_graph(length(c50));
mrc50 = medida_rendimiento_fmc(c50, F_c50, N)
