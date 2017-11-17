% F es el Fi a ser utilizado para el caso exacto

function mr = medida_rendimiento_fmc(F_exacto, F_fmc)
  % En el artículo sugerido hemos tomado la distancia en L^2 como la medida de rendimiento.
  % Esto es la integral del cuadrado de la resta entre el polinomio exacto y el obtenido, en el intervalo [0,1].

  mr = quad(@(point) rendimiento(point, F_exacto, F_fmc), 0, 1.0);
end

function r = rendimiento(point, F_exacto, F_fmc)
  point;
  rp_exacto = rp(point, F_exacto);
  rp_estimado = fmc_aplicado(point, F_fmc);

  r = (rp_exacto - rp_estimado)^2;
end
