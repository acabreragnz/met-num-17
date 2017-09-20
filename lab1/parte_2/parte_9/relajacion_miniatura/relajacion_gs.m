more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../../../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];
b = [1; 2; 3];

% GS converge, esto se asume gracias al teorema 4.5 Quarteroni o a este calculo
rho = radio_espectral(q_gauss_seidel(A))

% TODO: hablar sobre Symmetric successive over-relaxation

tic()
[l, m, n] = gauss_seidel(A, b, zeros(length(b), 1), 1000, 0.0001);
toc()

% w optimo para aplicar sor
w_opt = inf;
rho_opt = inf;

% notas de teorico, w_optimo es aquel que minimiza el radio espectral, con
% w en (1, 2)
for w=1:0.00001:2
  rho = radio_espectral(q_sor(A, w));

  if (rho_opt > rho)
    rho_opt = rho;
    w_opt = w;
  end
end

w_opt
rho_opt

tic()
[ll, mm, nn] = sor(A, b, zeros(length(b), 1), w_opt, 1000, 0.0001);
toc()
