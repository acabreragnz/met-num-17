% F es el Fi a ser utilizado para el caso exacto

function mr = medida_rendimiento_fmc(graph, F, N)
  % En el artículo sugerido hemos tomado la distancia en L^2 como la medida de rendimiento.
  % Esto es la integral del cuadrado de la resta entre el polinomio exacto y el obtenido, en el intervalo [0,1].
  [a, b, c, d] = quad(@(point) rendimiento(point, F, graph, N), 0, 1.0);

  mr = a;
end

function r = rendimiento(point, F, graph, N)
  rp_exacto = rp(point, F);
  rp_estimado = fmc(graph, point, N);

  r = (rp_exacto - rp_estimado)^2;
end
