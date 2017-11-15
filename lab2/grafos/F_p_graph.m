function F = F_p_graph(n)
  m = n - 1;

  F = zeros(m+1, 1);
  F(1) = 1;
end

% para grafo p
% Fi cantidad de grafos conexos luego de sacar i aristas
% F0 = 1
% F1 = 0 ... Fm = 0
