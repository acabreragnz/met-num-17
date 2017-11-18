more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);
N = 50;
rango_lejania_extremos = 0:0.0001:0.0025;
tipo_redondeo = 'none';
tipo_abscisas = 'equi';

run = 'p50'

if strcmp(run, 'p5')
  fprintf('Calculando medida de rendimiento fcm para p5 \n')
  index = 0;
  for i = rango_lejania_extremos
    i
    index++;
    F_p5 = F_p_graph(length(p5));
    [c_newton_p5, x_newton_p5] = mcc(p5, N, i, tipo_redondeo, tipo_abscisas);
    mrp5(index) = medida_rendimiento_mcc(F_p5, c_newton_p5, x_newton_p5);
  end

  % graficando
  plot(rango_lejania_extremos, mrp5, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo P5')
  ylabel('Medida de rendimiento');
  xlabel('Lejania a extremos');
end

if strcmp(run, 'p10')
  fprintf('Calculando medida de rendimiento fcm para p10 \n')
  rango_lejania_extremos = 0:0.01:0.04;

  index = 0;
  for i = rango_lejania_extremos
    index++;
    i
    F_p10 = F_p_graph(length(p10));
    [c_newton_p10, x_newton_p10] = mcc(p10, N, i, tipo_redondeo, tipo_abscisas);
    mrp10(index) = medida_rendimiento_mcc(F_p10, c_newton_p10, x_newton_p10);
  end

  % graficando
  plot(rango_lejania_extremos, mrp10, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo P10')
  ylabel('Medida de rendimiento');
  xlabel('Lejania a extremos');
end

if strcmp(run, 'p50')
  rango_lejania_extremos = 0:0.1:0.4;
  tipo_abscisas = 'equi';

  fprintf('Calculando medida de rendimiento fcm para p50 \n')
  index = 0;

  for i = rango_lejania_extremos
    i
    index++;
    F_p50 = F_p_graph(length(p50));
    [c_newton_p50, x_newton_p50] = mcc(p50, N, i, tipo_redondeo, tipo_abscisas);
    mrp50(index) = medida_rendimiento_mcc(F_p50, c_newton_p50, x_newton_p50);
  end

  % graficando
  plot(rango_lejania_extremos, mrp50, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo P50')
  ylabel('Medida de rendimiento');
  xlabel('Lejania a extremos');
end
