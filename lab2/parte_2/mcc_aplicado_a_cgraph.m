more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

N = 100;
lejania_extremos = 1/3;

fprintf('Calculando rp para c5 \n')
[c5_rp, c5_rpi, c5_abs, conexs] = mcc(c5, N, lejania_extremos);

fprintf('Calculando rp para c10 \n')
[c10_rp, c10_rpi, c10_abs, conexs] = mcc(c10, N, lejania_extremos);

fprintf('Calculando rp para c50 \n')
[c50_rp, c50_rpi, c50_abs, conexs] = mcc(c50, N, lejania_extremos);
