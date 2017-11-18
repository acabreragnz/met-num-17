more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

rango_N = 1:10;
lejania_extremos = 0.0025;
tipo_redondeo = 'none';
tipo_abscisas = 'equi';

% fprintf('Calculando medida de rendimiento fcm para p5 \n')
% for i = rango_N
%   i
%   F_p5 = F_p_graph(length(p5));
%   [c_newton_p5, x_newton_p5] = mcc(p5, i, lejania_extremos, tipo_redondeo, tipo_abscisas);
%   mrp5(i) = medida_rendimiento_mcc(F_p5, c_newton_p5, x_newton_p5);
% end
%
% % graficando
% plot(rango_N, mrp5, 'b');
% title('Medida de rendimiento (mr) de mcc para grafos tipo P5')
% ylabel('Confiabilidad');
% xlabel('Sorteo N');

% rango_N = 1:100;
% fprintf('Calculando medida de rendimiento fcm para p10 \n')
% for i = rango_N
%   i
%   F_p10 = F_p_graph(length(p10));
%   [c_newton_p10, x_newton_p10] = mcc(p10, i, lejania_extremos, tipo_redondeo, tipo_abscisas);
%   mrp10(i) = medida_rendimiento_mcc(F_p10, c_newton_p10, x_newton_p10);
% end
%
% % graficando
% plot(rango_N, mrp10, 'b');
% title('Medida de rendimiento (mr) de mcc para grafos tipo P10')
% ylabel('Confiabilidad');
% xlabel('Sorteo N');

rango_N = 1:50;
tipo_abscisas = 'equi';

fprintf('Calculando medida de rendimiento fcm para p50 \n')
for i = rango_N
  i
  F_p50 = F_p_graph(length(p50));
  [c_newton_p50, x_newton_p50] = mcc(p50, i, lejania_extremos, tipo_redondeo, tipo_abscisas);
  mrp50(i) = medida_rendimiento_mcc(F_p50, c_newton_p50, x_newton_p50);
end

% graficando
plot(rango_N, mrp50, 'b');
title('Medida de rendimiento (mr) de mcc para grafos tipo P50')
ylabel('Confiabilidad');
xlabel('Sorteo N');
