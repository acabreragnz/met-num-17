more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

p = 1/2;
N = 100;
lejania_extremos = 1/3;

fprintf('Calculando rp para c5 \n')
[c5_rp, F_c5] = fmc(c5, p, N, lejania_extremos);

fprintf('Calculando rp para c10 \n')
[c10_rp, F_c10] = fmc(c10, p, N, lejania_extremos);

fprintf('Calculando rp para c50 \n')
[c50_rp, F_c50] = fmc(c50, p, N, lejania_extremos);
