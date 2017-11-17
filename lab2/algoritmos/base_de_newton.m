
# Devuelve una base de Newton de cardinal n
function base = base_de_newton(n)
  
  base = zeros(n+1);
  base(1,n+1) = 1;
  
  for i = 2:n+1
    
    base(i,1:i) = productoria_de_newton(i-1);

  endfor
  
  base = base.'
  
endfunction