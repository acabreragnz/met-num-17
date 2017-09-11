more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../algoritmos'));

% cargo el problema
sistema = load('./../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

% reverse Cuthill-McKee permutation

% A = [29 34 -10; 34 41 -12; -10 -12 24];
% b = [1; 2; 3];

n = size(A)(1);

tic();
p = symrcm(A);
P = eye(n)(p, :);

% new matrix with lower bandwidth
% this is the same to do P * A * P'
% where the permution P matrix is calculated
% eye(n)(p, :)

PAPt = A(p, p);

% cholesky decomposition H to P * A * P'
L = chol(PAPt)';
L_trans = L';

% the equivalent problem to Ax=b
% is (P * A * P')(Px) = Pb

% We can write now P A P' = LL'

% Ax = b -> LL'x = b
% Ly = b    % sustitucion hacia adelante
% L'x = y   % sustitucion hacia atras

y = sustitucion_hacia_adelante(L, P * b);
x = sustitucion_hacia_atras(L_trans, y);

toc();

x = inv(P) * x;
