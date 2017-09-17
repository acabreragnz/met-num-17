function r = r_gauss_seidel(A, b)
  L = tril(A, -1);
  D = diag(diag(A));
  M = L + D;

  r = r_metodo_iterativo(M, b);
end
