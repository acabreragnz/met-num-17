function Q = q_gauss_seidel(A)
  L = tril(A, -1);
  D = diag(diag(A));
  M = L + D;

  Q = q_metodo_iterativo(M, A);
end
