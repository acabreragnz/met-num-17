function x = eg(A, b)
  [n, n] = size(A);
  L = zeros(n, n);

  %eg
  for k=1:n-1
    maxVal = 0;
    indexMax = 0;

    for r=k:n
      if abs(A(r, k)) > maxVal
        maxVal = abs(A(r, k));
        indexMax = r;
      end
    end

    %swap de filas
    A([indexMax, k], :) = A([k, indexMax], :);
    b([indexMax, k]) = b([k, indexMax]);

    for i=k+1:n
      L(i, k) = A(i, k) / A(k, k);
      A(i, k) = 0;
      b(i) = b(i) - L(i,k) * b(k);
      A(i, (k+1):n) = A(i, (k+1):n) - L(i, k) * A(k, (k+1):n);
    end
  end

  x = sustitucion_hacia_atras(A, b);
end
