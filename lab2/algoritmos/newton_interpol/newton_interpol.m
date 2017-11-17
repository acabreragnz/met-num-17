function value = newton_interpol(x, y, point)
  c = diferencias_divididas(x, y)(1, :);
  prod = newton_productoria(point, x)';

  value = c * prod;
end
