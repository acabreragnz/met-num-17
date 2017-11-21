more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

rango_N = 1:50;

fprintf('Calculando medida de rendimiento fcm para c5 \n')
for i = rango_N
  F_c5 = F_c_graph(length(c5));
  F_fmc_c5 = fmc(c5, i);
  mrc5(i) = medida_rendimiento_fmc(F_c5, F_fmc_c5);
end

fprintf('Calculando medida de rendimiento fcm para c10 \n')
for i = rango_N
  F_c10 = F_c_graph(length(c10));
  F_fmc_c10 = fmc(c10, i);
  mrc10(i) = medida_rendimiento_fmc(F_c10, F_fmc_c10);
end

fprintf('Calculando medida de rendimiento fcm para c50 \n')
for i = rango_N
  F_c50 = F_c_graph(length(c50));
  F_fmc_c50 = fmc(c50, i);
  mrc50(i) = medida_rendimiento_fmc(F_c50, F_fmc_c50);
end

% graficando
figure
plot(rango_N, mrc5, 'b');
title('Medida de rendimiento (mr) de fmc para grafos tipo C')
hold on

plot(rango_N, mrc10, 'g');
plot(rango_N, mrc50, 'r');
ylabel('Confiabilidad');
xlabel('Sorteo N');
legend('mr de fmc en c5',
  'mr de fmc en c10',
  'mr de fmc en c50'
);

hold off
