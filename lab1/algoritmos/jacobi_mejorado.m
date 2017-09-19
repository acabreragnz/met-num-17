function [x_sol, cant_iter, xk_suc] = jacobi(A, b, x0, max_iter, tolerancia)
  if nargin ~= 5
    error('Ingrese todos los parametros');
  end

  [m, n] = size(A);

  if n ~= m
    error('La matriz debe ser cuadrada');
  end

  k = 0;
  x_anterior = x0;
  xk = zeros(n, 1);
  error_absoluto = inf;
  xk_suc = [];

  while (k < max_iter & error_absoluto > tolerancia)

    # calculo de jacobi en filas
    suma_fila = A(1:n,:) * x_anterior;
    xk = x_anterior(1:n) + bsxfun(@rdivide, (b(1:n) - suma_fila), diag(A(1:n, 1:n)));

    # avanzo el iterador
    k++;

    # actualizacion de condicion y solucion
    error_absoluto = norm(xk - x_anterior);
    x_anterior = xk;
    xk_suc = [xk_suc, xk];
  end

  cant_iter = k;
  x_sol = xk;
end
