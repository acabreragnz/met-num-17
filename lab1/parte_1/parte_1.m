more off;
clear;
format long;
% cargo la matriz

addpath(genpath('./../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];
b = [1; 2; 3];
tic()
[H, L, b] = eg(A,b);
x = sustitucion_hacia_atras(H, b)
toc()

spy(H);
