function abscisas = chevyshev_abscisas(graph_dim, lejania_extremos = 0)
  a = 0;
  b = 1;

  if abs(lejania_extremos) >= (b - a)/2
    error('Lejania extremos es invalida');
  end

  total_abscisas = graph_dim + 1;
  new_a = a + lejania_extremos;
  new_b = b - lejania_extremos;

  abscisas = particion_chevyshev(new_a, new_b, total_abscisas);
  abscisas = flip(abscisas);
end

function X = particion_chevyshev(a, b, total_points)
  for i = 1:total_points
    X(i) = 1/2 * (a + b) + 1/2 * (b - a) * cos(pi * (2 * i - 1)/(2 * total_points));
  end
end
