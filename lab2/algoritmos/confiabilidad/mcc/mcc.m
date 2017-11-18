function [coef_interpol, abscisas, rpi, conexs] = mcc(graph, N = 100, lejania_extremos = 1/4, tipo_redondeo = "none", tipo_abscisas = "equi")
  graph_dim = size(graph, 1);

  if strcmp(tipo_abscisas, "equi")
    abscisas = mcc_abscisas(graph_dim, lejania_extremos);
  elseif strcmp(tipo_abscisas, "chevy")
    abscisas = chevyshev_abscisas(graph_dim, lejania_extremos);
  else
    error('tipo de abscisas invalido');
  end

  total_abscisas = length(abscisas);
  conexs = [];

  for index_abscisa = 1:total_abscisas
    [rpi_actual, conexs_actual] = estimate_rpi(graph, abscisas(index_abscisa), N);

    rpi(index_abscisa) = rpi_actual;
    conexs = [conexs; conexs_actual];
  end

  c = diferencias_divididas(abscisas, rpi)(1, :);

  if strcmp(tipo_redondeo, "hilbert")
    coef_interpol = redondeo_hilbert(abscisas, c)';
  elseif strcmp(tipo_redondeo, "simple")
    coef_interpol = round(c);
  elseif strcmp(tipo_redondeo, "none")
    coef_interpol = c;
  else
    error('tipo de redondeo invalido');
  end
end

function [rpi, conexs] = estimate_rpi(graph, probability, N)
  % devuelve los phi como [0, 1, 0, 1, 1 ...],
  % siendo 1 que el grafo sorteado quedo conexo
  conexs = random_conexity_graphs(graph, probability, N);

  rpi = sum(conexs) / N;
end

function conexs = random_conexity_graphs(graph, probability, N)
  for tirada = 1:N
    graph_prob = binornd(graph, probability);
    conexs(tirada) = isConnected(graph_prob);
  end
end
