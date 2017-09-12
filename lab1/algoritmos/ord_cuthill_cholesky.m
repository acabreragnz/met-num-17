

% cargo los algoritmos
% addpath(genpath('./../algoritmos'));

function [x, p, H] = ord_cuthill_cholesky(A, b, do_spy)
  n = size(A)(1);

  tic();
  p = symrcm(A);

  % new matrix with lower bandwidth
  % this is the same to do P * A * P'
  % where the permution P matrix is calculated
  % eye(n)(p, :)

  PAPt = A(p, p);

  % cholesky decomposition H to P * A * P'
  L = chol(PAPt)';
  L_trans = L';

  % the equivalent problem to Ax=b
  % is (P * A * P')(Px) = Pb

  % We can write now P A P' = LL'

  % Ax = b -> LL'x = b
  % Ly = b    % sustitucion hacia adelante
  % L'x = y   % sustitucion hacia atras

  y = sustitucion_hacia_adelante(L, b(p));
  x = sustitucion_hacia_atras(L_trans, y);
  toc();

  H = L_trans;
end
