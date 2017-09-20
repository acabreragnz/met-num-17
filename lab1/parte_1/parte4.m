% cargo los algoritmos
addpath(genpath('./../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];

D = [29 0 0; 0 41 0; 0 0 24];

b = [1; 2; 3];

D_inv = inv(D);

LU = [0 34 -10; 34 0 -12; -10 -12 0];

QJ = -D_inv * LU

RJ = D_inv * b

vp = eig(QJ)

x_inicial = [0; 0; 0];

[x, cantIter, xk] = jacobi(A, b, x_inicial, 100, 0.001)