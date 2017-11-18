#Recibe un polinomio escrito segun una base de Newton
#convierte los coeficientes a la base de Hilbert, redondea y
#devuelve los coeficientes del polinomio en la base de Newton
function coeficientes_redondeados = redondeo_canonica(coeficientes_newton, X)

  n = columns(coeficientes_newton)-1;

  # Obtener la base de Newton adecuada para este polinomio
  cIn = base_de_newton(X, n);

  # Obtener la matriz cambio de base Canonica a base de Newton
  nIc = matriz_cambio_canonica_b(cIn);
  # Cambio de coordenadas de Newton a Canonica
  coeficientes_canonica = cIn * coeficientes_newton.';
  # Cambio de coordenadas de Canonica a Newton luego de redondear
  coeficientes_redondeados = nIc * round(coeficientes_canonica);

endfunction