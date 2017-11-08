function rp = mcc(graph, N)
  graph_dim = size(graph, 1);

  abscisas = mcc_abscisas(graph_dim);
  total_abscisas = length(abscisas);

  for index_abscisa = 1:total_abscisas
    rpi_abscisas[index_abscisa] = estimate_rpi(graph, abscisas(index_abscisa), N);
  end

  rp = hilbert_round(newton_interpol(abscisas, rpi_abscisas));
end

function rpi = estimate_rpi(graph, probability, N)
  conexs = random_conexity_graphs(graph, probability, N); % devuelve algo como [0, 1, 0, 1, 1 ...]
  rpi = sum(conexs) / N;
end

function conexs = random_conexity_graphs(graph, probability, N)
  for tirada = 1:N
    conexs[tirada] = isConnected(binornd(graph, probability))
  end
end
