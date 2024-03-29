more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../../../algoritmos'));

sistema = load('./../../../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

% GS converge, esto se asume gracias al teorema 4.5 Quarteroni
roh = radio_espectral(q_gauss_seidel(A))

tic()
[l, m, n] = gauss_seidel(A, b, zeros(length(b), 1), 1000, 0.01);
toc()

% % w optimo para aplicar sor
% w_opt = inf;
% rho_opt = inf;
%
% % notas de teorico, w_optimo es aquel que minimiza el radio espectral, con
% % w en (1, 2)
% for w=1:0.1:2
%   rho = radio_espectral(q_sor(A, w));
%   if (rho_opt > rho)
%     rho_opt = rho;
%     w_opt = w;
%   end
% end
%
% w_opt
% rho_opt

% w_opt es 1.84101
tic()
[ll, mm, nn] = sor(A, b, zeros(length(b), 1), 1.84101, 1000, 0.01);
toc()
