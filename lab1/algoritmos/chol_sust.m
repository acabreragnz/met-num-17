function [x, H] = chol_sust(A, b)
  n = size(A, 1);

  main_tic = tic();

  fprintf("\nCholesky factorization...\n")
  tic();
  L_trans = chol(A);
  L = L_trans';
  toc();

  % Ax = b -> LL'x = b
  % Ly = b    % sustitucion hacia adelante
  % L'x = y   % sustitucion hacia atras

  fprintf("\nSustitucion hacia adelante...\n")
  tic();
  y = sustitucion_hacia_adelante(L, b);
  toc();

  fprintf("\nSustitucion hacia atras...\n")
  tic();
  x = sustitucion_hacia_atras(L_trans, y);
  toc();

  fprintf("\nTiempo de ejecucion total:\n")
  toc(main_tic);

  H = L_trans;
end
