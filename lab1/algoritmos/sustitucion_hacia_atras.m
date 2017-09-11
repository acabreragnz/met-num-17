function x = sustitucion_hacia_atras(A, b)
  [n, _] = size(b);
  x = zeros(n, 1);

  x(n) = b(n) / A(n, n);

  for i = n-1:-1:1
    suma = 0;

    for j = i+1:n
      suma = suma + A(i, j) * x(j);
    end

    x(i) = (b(i) - suma) / A(i, i);
  end
end
