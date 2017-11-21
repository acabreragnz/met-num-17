more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

c10 = c_graph(10);
c50 = c_graph(50);
tipo_redondeo = 'none';

run = 'c50'

if strcmp(run, 'c10')
  from_N = 50;
  rango_N = from_N:100;

  fprintf('Calculando medida de rendimiento fcm para c10 \n')
  lejania_extremos = 0.02;

  for i = rango_N
    i
    F_c10 = F_c_graph(length(c10));
    [c_newton_equi, x_equi_newton] = mcc(c10, i, lejania_extremos, tipo_redondeo, 'equi');
    [c_newton_chevy, x_chevy_newton] = mcc(c10, i, 0, tipo_redondeo, 'chevy');

    equi_mrc10(i - from_N + 1) = medida_rendimiento_mcc(F_c10, c_newton_equi, x_equi_newton);
    chevy_mrc10(i - from_N + 1) = medida_rendimiento_mcc(F_c10, c_newton_chevy, x_chevy_newton);
  end


  % graficando
  figure
  plot(rango_N, equi_mrc10, 'b');
  title('Medida de rendimiento (mr) de fmc para grafos tipo C')
  hold on

  plot(rango_N, chevy_mrc10, 'g');
  ylabel('Medida de rendimiento');
  xlabel('Sorteo N');
  legend('mr de mcc con abscisas equi en c10', 'mr de mcc con abscisas chevy en c10');

  hold off
end

if strcmp(run, 'c50')
  from_N = 10;
  rango_N = from_N:30;

  fprintf('Calculando medida de rendimiento fcm para c10 \n')
  lejania_extremos = 0.25;

  for i = rango_N
    i
    F_c50 = F_c_graph(length(c50));
    [c_newton_equi, x_equi_newton] = mcc(c50, i, lejania_extremos, tipo_redondeo, 'equi');
    [c_newton_chevy, x_chevy_newton] = mcc(c50, i, 0, tipo_redondeo, 'chevy');

    equi_mrc50(i - from_N + 1) = medida_rendimiento_mcc(F_c50, c_newton_equi, x_equi_newton);
    chevy_mrc50(i - from_N + 1) = medida_rendimiento_mcc(F_c50, c_newton_chevy, x_chevy_newton);
  end


  % graficando
  figure
  plot(rango_N, equi_mrc50, 'b');
  title('Medida de rendimiento (mr) de fmc para grafos tipo C')
  hold on

  plot(rango_N, chevy_mrc50, 'g');
  ylabel('Medida de rendimiento');
  xlabel('Sorteo N');
  legend('mr de mcc con abscisas equi en c50', 'mr de mcc con abscisas chevy en c50');

  hold off
end
