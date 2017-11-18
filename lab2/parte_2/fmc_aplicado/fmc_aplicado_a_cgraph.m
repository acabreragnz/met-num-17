more off;
clear;
format long;

addpath(genpath('./../../algoritmos'));
addpath(genpath('./../../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

N = 100;

fprintf('Calculando medida de rendimiento fcm para c5 \n')
F_c5 = F_c_graph(length(c5));
F_fmc_c5 = fmc(c5, N);
mrc5 = medida_rendimiento_fmc(F_c5, F_fmc_c5)

fprintf('Calculando medida de rendimiento fcm para c10 \n')
F_c10 = F_c_graph(length(c10));
F_fmc_c10 = fmc(c10, N);
mrc10 = medida_rendimiento_fmc(F_c10, F_fmc_c10)

fprintf('Calculando medida de rendimiento fcm para c50 \n')
F_c50 = F_c_graph(length(c50));
F_fmc_c50 = fmc(c50, N);
mrc50 = medida_rendimiento_fmc(F_c50, F_fmc_c50)
