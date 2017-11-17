
#Devuelve una base de hilbert de cardinal n
function base = base_de_hilbert(n)

  base = zeros(n+1);
  base(1,n+1) = 1;

  for i = 2:n+1
    base(i,1:i) = shifted_legendre_poly(i-1);
  endfor
  base = base.';

endfunction
