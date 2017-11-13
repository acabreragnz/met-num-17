function [rp, rpi, abscisas, conexs] = mcc(graph, N = 100, lejania_extremos = 1/4)
  graph_dim = size(graph, 1);

  abscisas = mcc_abscisas(graph_dim, lejania_extremos);
  total_abscisas = length(abscisas);
  conexs = [];

  for index_abscisa = 1:total_abscisas
    [rpi_actual, conexs_actual] = estimate_rpi(graph, abscisas(index_abscisa), N);

    rpi(index_abscisa) = rpi_actual;
    conexs = [conexs; conexs_actual];
  end

  rp = hilbert_round(newton_interpol(abscisas, rpi));
  % por ahora concuerda en valor con rpi, ya que newton y hilbert no estan implementados
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

function r = hilbert_round(x)
  r = x; % hay que implementarlo
end
