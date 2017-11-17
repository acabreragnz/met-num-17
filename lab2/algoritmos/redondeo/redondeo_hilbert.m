#Recibe un polinomio escrito segun una base de Newton
#convierte los coeficientes a la base de Hilbert, redondea y
#devuelve los coeficientes del polinomio en la base can�nica
function coef = redondeo_hilbert(coeficientes_newton, X)

  n = columns(coeficientes_newton)-1;

  # Obtener las bases de Newton y Hilbert adecuadas para este polinomio
  base_newton = base_de_newton(X, n);
  base_hilbert = base_de_hilbert(n);

  # Definir las matrices para aplicar el teorema de cambio de base

  deth = det(base_hilbert);

  hIc = inv(base_hilbert);
  cIn = base_newton;

  # Cambio de base
  hIn = hIc * cIn;

  # Cambio de coordenadas de Newton a Hilbert
  coeficientes_hilbert = hIn * coeficientes_newton.';

  # Cambio de coordenadas de Hilbert a Can�nica
  #inv_h = inv(hIn);

  detn = det(base_newton);

  nIc = inv(base_newton);
  nIh = nIc*base_hilbert;

  coef = nIh * round(coeficientes_hilbert);

endfunction
