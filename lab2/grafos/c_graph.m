function graph = c_graph(n)
  if n < 2
    error('n invalido, intente generar grafos con al menos dos nodos');
  end

  pn_graph = p_graph(n);

  % linkeando extremos
  pn_graph(1, end) = 1;
  pn_graph(end, 1) = 1;

  graph = pn_graph;
end
