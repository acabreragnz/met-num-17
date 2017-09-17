function r = r_jacobi(A, b)
  D = diag(diag(A));
  M = D;

  r = r_metodo_iterativo(M, b);
end
