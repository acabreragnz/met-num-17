function prod = newton_productoria(x, X)
  prod = [1];
  n = length(X);

  for i=2:n
    prod(i) = (x - X(i - 1)) * prod(i - 1);
  end
end
