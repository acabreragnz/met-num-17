function x = sustitucion_hacia_atras(U, b, acelerado = true)
  n = length(b);
  x = zeros(n, 1);

  if (acelerado)
    for i = n:-1:1
      x(i) = (b(i) - U(i, :) * x) / U(i, i);
    end
  else
    x(n) = b(n) / U(n, n);

    for i = n-1:-1:1
      suma = 0;

      for j = i+1:n
        suma = suma + U(i, j) * x(j);
      end

      x(i) = (b(i) - suma) / U(i, i);
    end
  end
end
