% cargo los algoritmos
addpath(genpath('./../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];

LD = [29 0 0; 39 41 0; -10 -12 24];

b = [1; 2; 3];

LD_inv = -inv(LD);

U = [0 34 -10; 30 0 -12; 0 0 0];

QGS = -LD_inv * U

RGS = LD_inv * b

vp = eig(QGS)

x_inicial = [0; 0; 0];

[x, cantIter, xk] = gauss_seidel(A, b, x_inicial, 100, 0.001)
