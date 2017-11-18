# Recibe una base vectorial expresada como una matriz triangular inferiorto
# devuelve la matriz de cambio de base Canonica a la base b

function bIc = matriz_cambio_canonica_b(b)
   
  n = rows(b);
  bIc = zeros(n);
  for i = 1:n
    bIc(:,i) = sustitucion_hacia_atras(flipud(b), flipud(eye(n))(:,i));
  endfor
  
endfunction