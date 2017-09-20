function [H, L, v]  = eg(A, b)
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


    L(k+1:n, k) = A(k+1:n, k) / A(k, k);
    A(k+1:n, k) = 0;
    b(k+1:n) = b(k+1:n) - L(k+1:n,k) * b(k);
    A(k+1:n, (k+1):n) = A(k+1:n, (k+1):n) - L(k+1:n, k) * A(k, (k+1):n);

  end

  H = A;
  v = b;
end
