more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

c5 = c_graph(5);
c10 = c_graph(10);
c50 = c_graph(50);

rango_N = 1:10;
lejania_extremos = 0.0025;
tipo_redondeo = 'none';
tipo_abscisas = 'equi';

run = 'c50'

if strcmp(run, 'c5')
  fprintf('Calculando medida de rendimiento fcm para c5 \n')
  for i = rango_N
    i
    F_c5 = F_c_graph(length(c5));
    [c_newton_c5, x_newton_c5] = mcc(c5, i, lejania_extremos, tipo_redondeo, tipo_abscisas);
    mrc5(i) = medida_rendimiento_mcc(F_c5, c_newton_c5, x_newton_c5);
  end

  % graficando
  plot(rango_N, mrc5, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo c5')
  ylabel('Confiabilidad');
  xlabel('Sorteo N');
end

if strcmp(run, 'c10')
  rango_N = 1:100;
  fprintf('Calculando medida de rendimiento fcm para c10 \n')
  for i = rango_N
    i
    F_c10 = F_c_graph(length(c10));
    [c_newton_c10, x_newton_c10] = mcc(c10, i, lejania_extremos, tipo_redondeo, tipo_abscisas);
    mrc10(i) = medida_rendimiento_mcc(F_c10, c_newton_c10, x_newton_c10);
  end

  % graficando
  plot(rango_N, mrc10, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo c10')
  ylabel('Confiabilidad');
  xlabel('Sorteo N');
end


if strcmp(run, 'c50')
  rango_N = 1:50;
  tipo_abscisas = 'equi';

  fprintf('Calculando medida de rendimiento fcm para c50 \n')
  for i = rango_N
    i
    F_c50 = F_c_graph(length(c50));
    [c_newton_c50, x_newton_c50] = mcc(c50, i, lejania_extremos, tipo_redondeo, tipo_abscisas);
    mrc50(i) = medida_rendimiento_mcc(F_c50, c_newton_c50, x_newton_c50);
  end

  % graficando
  plot(rango_N, mrc50, 'b');
  title('Medida de rendimiento (mr) de mcc para grafos tipo c50')
  ylabel('Confiabilidad');
  xlabel('Sorteo N');
end
