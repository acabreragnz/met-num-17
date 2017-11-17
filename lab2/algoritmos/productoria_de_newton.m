

function y = productoria_de_newton(n)
  
  y = zeros(1, n+1);
  y(1, 1:2) = [1 -1];
  for i = 2:n
    
    factor = zeros(1, n+1);
    factor(1, 1:2) = [1 -i];
    
    y = conv(y,factor);
    
  endfor
  
  y = y(1,1:n+1);
  
endfunction