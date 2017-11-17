
# Devuelve una base de Newton de cardinal n
function base = base_de_newton(X, n)

  base = zeros(n+1);
  base(1,n+1) = 1;

  for i = 2:n+1

    base(i,end-(i-1):end) = polinomio_newton_base_canonica(X, i-1);

  endfor

  base = base.';

endfunction
