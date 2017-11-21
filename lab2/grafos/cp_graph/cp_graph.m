function [graph, dim] = cp_graph(c_dim, p_dim)
  if c_dim < 2 || p_dim < 2
    error('dim invalido, intente generar grafos con al menos dos nodos');
  end

  dim = c_dim + p_dim;
  p = p_graph(p_dim);
  c = c_graph(c_dim);

  cp = zeros(dim);
  cp(1:c_dim, 1:c_dim) = c;
  cp(c_dim+1:dim, c_dim+1:dim) = p;
  cp(c_dim, c_dim + 1) = 1;
  cp(c_dim + 1, c_dim) = 1;

  graph = cp;
end
