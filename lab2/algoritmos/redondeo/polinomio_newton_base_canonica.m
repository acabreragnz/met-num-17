function y = polinomio_newton_base_canonica(X, n)

  y = zeros(1, n+1);
  y(1, n:n+1) = [1 -X(1)];
  for i = 2:n

    factor = zeros(1, n+1);
    factor(1, n:n+1) = [1 -X(i)];

    y = conv(y,factor);

  endfor

  y = y(1,end-(n):end);

endfunction
