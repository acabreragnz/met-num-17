
# Devuelve una base de Newton de cardinal n
function base = base_de_newton(n)
  
  base = zeros(n+1);
  base(1,n+1) = 1;
  
  for i = 2:n+1
    
    # Productoria de (x-1)...(x-n)
    y = zeros(1, n+1);
    y(1, 1:2) = [1 -1]
    for j = 2:n
      factor = zeros(1, n+1)
      factor(1, 1:2) = [1 -j]
      y = conv(y,factor);
    endfor
    y = y(1,1:n+1);
    
    base(i,1:i) = y;

  endfor
  
  base = base.'
  
endfunction