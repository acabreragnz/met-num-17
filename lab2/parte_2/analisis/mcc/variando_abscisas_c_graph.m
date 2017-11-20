more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);
N = 50;
rango_lejania_extremos = 0:0.0001:0.0025;
tipo_redondeo = 'none';
tipo_abscisas = 'equi';

run = 'c50'

if strcmp(run, 'c5')
  fprintf('Calculando medida de rendimiento fcm para c5 \n')
  index = 0;
  for i = rango_lejania_extremos
    i
    index++;
    F_c5 = F_c_graph(length(c5));
    [c_newton_c5, x_newton_c5] = mcc(c5, N, i, tipo_redondeo, tipo_abscisas);
    mrc5(index) = medida_rendimiento_mcc(F_c5, c_newton_c5, x_newton_c5);
  end

  % graficando
  plot(rango_lejania_extremos, mrc5, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo c5')
  ylabel('Medida de rendimiento');
  xlabel('Lejania a extremos');
end

if strcmp(run, 'c10')
  fprintf('Calculando medida de rendimiento fcm para c10 \n')
  rango_lejania_extremos = 0:0.01:0.04;

  index = 0;
  for i = rango_lejania_extremos
    index++;
    i
    F_c10 = F_c_graph(length(c10));
    [c_newton_c10, x_newton_c10] = mcc(c10, N, i, tipo_redondeo, tipo_abscisas);
    mrc10(index) = medida_rendimiento_mcc(F_c10, c_newton_c10, x_newton_c10);
  end

  % graficando
  plot(rango_lejania_extremos, mrc10, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo c10')
  ylabel('Medida de rendimiento');
  xlabel('Lejania a extremos');
end

if strcmp(run, 'c50')
  rango_lejania_extremos = 0:0.1:0.4;
  tipo_abscisas = 'equi';

  fprintf('Calculando medida de rendimiento fcm para c50 \n')
  index = 0;

  for i = rango_lejania_extremos
    i
    index++;
    F_c50 = F_c_graph(length(c50));
    [c_newton_c50, x_newton_c50] = mcc(c50, N, i, tipo_redondeo, tipo_abscisas);
    mrc50(index) = medida_rendimiento_mcc(F_c50, c_newton_c50, x_newton_c50);
  end

  % graficando
  plot(rango_lejania_extremos, mrc50, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo c50')
  ylabel('Medida de rendimiento');
  xlabel('Lejania a extremos');
end
