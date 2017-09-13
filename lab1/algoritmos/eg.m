function x = eg(A, b)
  [n, n] = size(A);
  L = zeros(n, n);

  for k=1:n-1
    for i=k+1:n
      L(i, k) = A(i, k) / A(k, k);
      A(i, k) = 0;
      b(i) = b(i) - L(i,k) * b(k);
      for j=k+1:n
        A(i,j) = A(i,j) - L(i, k) * A(k,j);
      end
    end
  end

  A
  L
  x = sustitucion_hacia_atras(A, b);
end
