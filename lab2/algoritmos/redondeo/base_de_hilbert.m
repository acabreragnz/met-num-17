
#Devuelve una base de hilbert de cardinal n
function base = base_de_hilbert(n)

  base = zeros(n+1);
  for i = 0:n
    
    base(i+1,end-(i):end) = sqrt(2*i+1)*shifted_legendre_poly(i);
  endfor
  base = base.';

endfunction
