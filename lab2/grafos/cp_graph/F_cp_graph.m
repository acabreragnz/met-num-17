function F = F_cp_graph(c_dim, p_dim)
  m_p = p_dim - 1;
  m_c = c_dim;
  m = m_p + m_c;

  F = zeros(m+1, 1);
  F(1:c_dim+1) = F_c_graph(c_dim);
end

% para grafo c
% Fi cantidad de grafos conexos luego de sacar i aristas
% F0 = 1
% F1 = c_dim
% F2 = 0 ... Fc_dim+p_dimc = 0
