function F = F_c_graph(n)
  m = n;

  F = zeros(m+1, 1);
  F(1) = 1;
  F(2) = n;
end

% para grafo c
% Fi cantidad de grafos conexos luego de sacar i aristas
% F0 = 1
% F1 = m (m y n coinciden)
% F2 = 0 ... Fm = 0
