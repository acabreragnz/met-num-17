
#Recibe un polinomio escrito segun una base de Newton
#convierte los coeficientes a la base de Hilbert, redondea y
#devuelve los coeficientes del polinomio en la base de newton
function coef = redondeo_hilbert(coeficientes_newton)
 
  n = columns(coeficientes_newton)-1

  # Cálculo de la matriz de cambio de base de Newton a Hilbert (hIc * cIn)
  hIn = inv(base_de_hilbert(n)) * base_de_newton(n);
  
  # Se calculan y redondean los coeficientes en la base de Hilbert,
  # obtenidos mediante cambio de coordenadas Newton->Hilbert.
  # Luego, se reaplica el cambio de coordenadas Newton->Hilbert
  # para devolver el polinomio expresado en la base de newton.
  coef = inv(hIn)*round(hIn * coeficientes_newton.';);
  
endfunction
