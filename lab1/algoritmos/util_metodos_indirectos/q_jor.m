function Q = q_jor(A, w)
  D = diag(diag(A));
  M = D;

  Q_jac = q_jacobi(A);
  Q = w * Q_jac + (1 - w) * eye(size(A, 1));
end
