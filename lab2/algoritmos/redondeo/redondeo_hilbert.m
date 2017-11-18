#Recibe un polinomio escrito segun una base de Newton
#convierte los coeficientes a la base de Hilbert, redondea y
#devuelve los coeficientes del polinomio en la base de Newton
function coeficientes_redondeados = redondeo_hilbert(coeficientes_newton, X)

  n = columns(coeficientes_newton)-1;

  # Obtener las bases de Newton y Hilbert adecuadas para este polinomio
  cIn = base_de_newton(X, n);
  cIh = base_de_hilbert(n);

  # Obtener la matriz cambio de base Canonica a base de Hilbert
  hIc = matriz_cambio_canonica_b(cIh);
  # Obtener la matriz cambio de base Canonica a base de Newton
  nIc = matriz_cambio_canonica_b(cIn);
  # Cambio de coordenadas de Newton a Hilbert
  coeficientes_hilbert = (hIc * cIn) * coeficientes_newton.';
  # Cambio de coordenadas de Hilbert a Newton luego de redondear
  coeficientes_redondeados = (nIc * cIh) * round(coeficientes_hilbert);

endfunction
