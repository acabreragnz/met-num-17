more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../../../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];
b = [1; 2; 3];

% Jacobi no converge
rho = radio_espectral(q_jacobi(A))

% w optimo para aplicar jor
w_opt = inf;
rho_opt = inf;

% subrelajacion para obtener convergencia
for w=0.00001:0.00001:1
  rho = radio_espectral(q_jor(A, w));

  if (rho_opt > rho)
    rho_opt = rho;
    w_opt = w;
  end
end

w_opt
rho_opt

tic()
[ll, mm, nn] = jor_mejorado(A, b, zeros(length(b), 1), w_opt, 2000, 0.0001);
toc()
