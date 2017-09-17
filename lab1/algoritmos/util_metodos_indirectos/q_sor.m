function Q = q_sor(A, w)
  L = tril(A, -1);
  D = diag(diag(A));
  M = L + 1/w * D;

  Q = q_metodo_iterativo(M, A);
end
