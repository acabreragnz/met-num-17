function [x_sol, cant_iter, xk_suc] = jor(A, b, x0, w, max_iter, tolerancia)
  if nargin ~= 6
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
    for i = 1:n
      suma_fila = A(i,:) * x_anterior;

      jacobi = x_anterior(i) + (b(i) - suma_fila) / A(i, i);

      % jor
      xk(i) = jacobi * w + (1 - w) * x_anterior(i);
    end

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
