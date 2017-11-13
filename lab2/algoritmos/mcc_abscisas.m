function abscisas = mcc_abscisas(graph_dim, lejania_extremos = 0)
  a = 0;
  b = 1;

  if abs(lejania_extremos) >= (b - a)/2
    error('Lejania extremos es invalida');
  end

  total_abscisas = graph_dim + 1;
  new_a = a + lejania_extremos;
  new_b = b - lejania_extremos;

  abscisas = particion_equidistante(new_a, new_b, total_abscisas);
end

function particion = particion_equidistante(a, b, total_points)
  paso = (b - a) / (total_points - 1);
  particion = a:paso:b;

  % otra forma posible seria:
  % paso = (b - a) / total_points - 1;
  % particion = a + (0:total_points-1) * paso;
end
