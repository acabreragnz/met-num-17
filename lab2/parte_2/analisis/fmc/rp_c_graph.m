more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

c10 = c_graph(10);
N = 50;
rango_p = 0:0.01:1;

index = 0;
for p = rango_p
  p
  index++;

  F_fmc = fmc(c10, N);
  confiab_c10(index) = fmc_aplicado(p, F_fmc);
end

% graficando
plot(rango_p, confiab_c10, 'b');
title('Confiabilidad (Rgp) de fmc para grafo tipo C10')
ylabel('Confiabilidad');
xlabel('probabilidad p de funcionamiento');
