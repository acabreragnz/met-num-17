more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

rango_N = 1:100;

fprintf('Calculando medida de rendimiento fcm para p5 \n')
for i = rango_N
  F_p5 = F_p_graph(length(p5));
  F_fmc_p5 = fmc(p5, i);
  mrp5(i) = medida_rendimiento_fmc(F_p5, F_fmc_p5);
end

fprintf('Calculando medida de rendimiento fcm para p10 \n')
for i = rango_N
  F_p10 = F_p_graph(length(p10));
  F_fmc_p10 = fmc(p10, i);
  mrp10(i) = medida_rendimiento_fmc(F_p10, F_fmc_p10);
end

fprintf('Calculando medida de rendimiento fcm para p50 \n')
for i = rango_N
  F_p50 = F_p_graph(length(p50));
  F_fmc_p50 = fmc(p50, i);
  mrp50(i) = medida_rendimiento_fmc(F_p50, F_fmc_p50);
end

% graficando
figure
plot(rango_N, mrp5, 'b');
title('Medida de rendimiento (mr) de fmc para grafos tipo P')
hold on

plot(rango_N, mrp10, 'g');
plot(rango_N, mrp50, 'r');
ylabel('Confiabilidad');
xlabel('Sorteo N');
legend('mr de fmc en p5',
  'mr de fmc en p10',
  'mr de fmc en p50'
);

hold off
