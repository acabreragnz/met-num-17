more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

p10 = p_graph(10);
N = 50;
rango_p = 0:0.01:1;

index = 0;
for p = rango_p
  p
  index++;

  F_fmc = fmc(p10, N);
  confiab_p10(index) = fmc_aplicado(p, F_fmc);
end

% graficando
plot(rango_p, confiab_p10, 'b');
title('Confiabilidad (Rgp) de mcc para grafo tipo P10')
ylabel('Confiabilidad');
xlabel('probabilidad p de funcionamiento');
