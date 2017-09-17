function Q = q_jacobi(A)
  D = diag(diag(A));
  M = D;

  Q = q_metodo_iterativo(M, A);
end
