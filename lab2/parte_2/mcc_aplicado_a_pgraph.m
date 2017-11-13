more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

N = 100;
lejania_extremos = 1/3;

fprintf('Calculando rp para p5 \n')
[p5_rp, p5_rpi, p5_abs, conexs] = mcc(p5, N, lejania_extremos);

fprintf('Calculando rp para p10 \n')
[p10_rp, p10_rpi, p10_abs, conexs] = mcc(p10, N, lejania_extremos);

fprintf('Calculando rp para p50 \n')
[p50_rp, p50_rpi, p50_abs, conexs] = mcc(p50, N, lejania_extremos);
