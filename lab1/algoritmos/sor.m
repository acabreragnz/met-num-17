function [x_sol, cant_iter, xk_suc] = sor(A, b, x0, w, max_iter, tolerancia)
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
      suma_rapida = 0;
      suma_as_jacobi = 0;

      suma_rapida += A(i,1:i-1) * xk(1:i-1);
      suma_as_jacobi += A(i,i+1:n) * x_anterior(i+1:n);

      gauss_seidel = (b(i) - suma_rapida - suma_as_jacobi) / A(i, i);

      % sor
      xk(i) = gauss_seidel * w + (1 - w) * x_anterior(i);
    end

    # avanzo el iterador
    k++;

    # actualizacion de condicion y solucion
    error_absoluto = norm(A * xk - b);

    x_anterior = xk;
    xk_suc = [xk_suc, xk];
  end

  cant_iter = k;
  x_sol = xk;
end
