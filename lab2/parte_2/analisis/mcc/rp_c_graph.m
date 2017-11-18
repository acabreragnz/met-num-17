more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

c10 = c_graph(10);
N = 50;
lejania_extremos = 0.25;
tipo_redondeo = 'none';
tipo_abscisas = 'equi';

rango_p = 0:0.01:1;

index = 0;
for p = rango_p
  p
  index++;

  [c_newton_c10, x_newton_c10] = mcc(c10, N, lejania_extremos, tipo_redondeo, tipo_abscisas);
  confiab_c10(index) = newton_interpol_from_coef(p, c_newton_c10, x_newton_c10);
end

% graficando
plot(rango_p, confiab_c10, 'b');
title('Confiabilidad (Rgp) de mcc para grafo tipo C10')
ylabel('Confiabilidad');
xlabel('probabilidad p de funcionamiento');
