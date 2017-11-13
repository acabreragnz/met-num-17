more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

p = 1/2;
N = 100;
lejania_extremos = 1/3;

fprintf('Calculando rp para p5 \n')
[p5_rp, F_p5] = fmc(p5, p, N, lejania_extremos);

fprintf('Calculando rp para p10 \n')
[p10_rp, F_p10] = fmc(p10, p, N, lejania_extremos);

fprintf('Calculando rp para p50 \n')
[p50_rp, F_p50] = fmc(p50, p, N, lejania_extremos);
