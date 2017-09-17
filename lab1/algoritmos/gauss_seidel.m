function [x_sol, cant_iter, xk_suc] = gauss_seidel(A, b, x0, max_iter, tolerancia)
  more off;

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
    for i = 1:n
      suma_rapida = 0;
      suma_as_jacobi = 0;

      for j = 1:i-1
        suma_rapida += A(i,j) * xk(j);
      end

      for j = i+1:n
        suma_as_jacobi += A(i,j) * x_anterior(j);
      end

      xk(i) = (b(i) - suma_rapida - suma_as_jacobi) / A(i, i);
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
