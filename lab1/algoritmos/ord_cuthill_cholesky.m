

% cargo los algoritmos
% addpath(genpath('./../algoritmos'));

function [x, p, H] = ord_cuthill_cholesky(A, b, do_reverse = false)
  n = size(A)(1);

  main_tic = tic();

  if (do_reverse)
    fprintf("\nReverse Cuthill-McKee...\n")
    tic();
    p = symrcm(A);
    toc();
  else
    fprintf("\nDirect Cuthill-McKee...\n")
    tic();
    p = symamd(A);
    toc();
  end

  % new matrix with lower bandwidth
  % this is the same to do P A P'
  % where the permution P matrix is calculated
  % eye(n)(p, :)

  PAPt = A(p, p);

  % cholesky decomposition H to P A P'

  fprintf("\nCholesky factorization...\n")
  tic();
  L_trans = chol(PAPt);
  L = L_trans';
  toc();

  % the equivalent problem to Ax=b
  % is (P A P')(Px) = Pb

  % We can write now P A P' = LL'

  % Ax = b -> LL'x = b
  % Ly = b    % sustitucion hacia adelante
  % L'x = y   % sustitucion hacia atras

  fprintf("\nSustitucion hacia adelante...\n")
  tic();
  y = sustitucion_hacia_adelante(L, b(p));
  toc();

  fprintf("\nSustitucion hacia atras...\n")
  tic();
  x = sustitucion_hacia_atras(L_trans, y);
  toc();

  fprintf("\nTiempo de ejecucion total:\n")
  toc(main_tic);

  H = L_trans;
end
