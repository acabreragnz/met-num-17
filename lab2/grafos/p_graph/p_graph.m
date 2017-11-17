function graph = p_graph(n)
  if n < 2
    error('n invalido, intente generar grafos con al menos dos nodos');
  end

  v = ones(1, n);
  graph = diag(v) + diag(v(1:n-1), 1) + diag(v(1:n-1), -1);
end
