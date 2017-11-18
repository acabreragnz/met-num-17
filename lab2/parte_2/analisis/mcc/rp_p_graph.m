more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

p10 = p_graph(10);
N = 50;
lejania_extremos = 0.25;
tipo_redondeo = 'none';
tipo_abscisas = 'equi';

rango_p = 0:0.01:1;

index = 0;
for p = rango_p
  p
  index++;

  [c_newton_p10, x_newton_p10] = mcc(p10, N, lejania_extremos, tipo_redondeo, tipo_abscisas);
  confiab_p10(index) = newton_interpol_from_coef(p, c_newton_p10, x_newton_p10);
end

% graficando
plot(rango_p, confiab_p10, 'b');
title('Confiabilidad (Rgp) de mcc para grafo tipo P10')
ylabel('Confiabilidad');
xlabel('probabilidad p de funcionamiento');
