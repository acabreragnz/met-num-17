% F es el Fi a ser utilizado para el caso exacto

function mr = medida_rendimiento_mcc(graph, F, N, lejania_extremos)

  % En el artículo sugerido hemos tomado la distancia en L^2 como la medida de rendimiento.
  % Esto es la integral del cuadrado de la resta entre el polinomio exacto y el obtenido, en el intervalo [0,1].
  mr = quad(@(point) rendimiento(point, F, graph, N, lejania_extremos), 0, 1.0);
end

function r = rendimiento(point, F, graph, N, lejania_extremos)
  rp_exacto = rp(point, F);
  rp_estimado = mcc(graph, point, N, lejania_extremos);

  r = (rp_exacto - rp_estimado)^2;
end
