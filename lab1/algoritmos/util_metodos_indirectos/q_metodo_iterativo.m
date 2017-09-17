function q = q_metodo_iterativo(M, A)
  q = inv(M) * (M - A);
end
