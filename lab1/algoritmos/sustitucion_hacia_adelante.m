function x = sustitucion_hacia_adelante(L, b, acelerado = true)
  n = length(b);
  x = zeros(n, 1);

  if (acelerado)
    for i = 1:n
      x(i) = (b(i) - L(i, :) * x) / L(i, i);
    end
  else
    x(1) = b(1) / L(1, 1);

    for i = 2:n
      suma = 0;

      for j = 1:i-1
        suma = suma + L(i, j) * x(j);
      end

      x(i) = (b(i) - suma) / L(i, i);
    end
  end
end
