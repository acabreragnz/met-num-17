more off;
clear;
format long;

addpath(genpath('./../../../algoritmos'));
addpath(genpath('./../../../grafos'));

p10 = p_graph(10);
p50 = p_graph(50);
tipo_redondeo = 'none';

run = 'p50'

if strcmp(run, 'p10')
  from_N = 50;
  rango_N = from_N:100;

  fprintf('Calculando medida de rendimiento fcm para p10 \n')
  lejania_extremos = 0.02;

  for i = rango_N
    i
    F_p10 = F_p_graph(length(p10));
    [c_newton_equi, x_equi_newton] = mcc(p10, i, lejania_extremos, tipo_redondeo, 'equi');
    [c_newton_chevy, x_chevy_newton] = mcc(p10, i, 0, tipo_redondeo, 'chevy');

    equi_mrp10(i - from_N + 1) = medida_rendimiento_mcc(F_p10, c_newton_equi, x_equi_newton);
    chevy_mrp10(i - from_N + 1) = medida_rendimiento_mcc(F_p10, c_newton_chevy, x_chevy_newton);
  end


  % graficando
  figure
  plot(rango_N, equi_mrp10, 'b');
  title('Medida de rendimiento (mr) de fmc para grafos tipo P')
  hold on

  plot(rango_N, chevy_mrp10, 'g');
  ylabel('Medida de rendimiento');
  xlabel('Sorteo N');
  legend('mr de mcc con abscisas equi en p10', 'mr de mcc con abscisas chevy en p10');

  hold off
end

if strcmp(run, 'p50')
  from_N = 10;
  rango_N = from_N:30;

  fprintf('Calculando medida de rendimiento fcm para p10 \n')
  lejania_extremos = 0.25;

  for i = rango_N
    i
    F_p50 = F_p_graph(length(p50));
    [c_newton_equi, x_equi_newton] = mcc(p50, i, lejania_extremos, tipo_redondeo, 'equi');
    [c_newton_chevy, x_chevy_newton] = mcc(p50, i, 0, tipo_redondeo, 'chevy');

    equi_mrp50(i - from_N + 1) = medida_rendimiento_mcc(F_p50, c_newton_equi, x_equi_newton);
    chevy_mrp50(i - from_N + 1) = medida_rendimiento_mcc(F_p50, c_newton_chevy, x_chevy_newton);
  end


  % graficando
  figure
  plot(rango_N, equi_mrp50, 'b');
  title('Medida de rendimiento (mr) de fmc para grafos tipo P')
  hold on

  plot(rango_N, chevy_mrp50, 'g');
  ylabel('Medida de rendimiento');
  xlabel('Sorteo N');
  legend('mr de mcc con abscisas equi en p10', 'mr de mcc con abscisas chevy en p10');

  hold off
end
