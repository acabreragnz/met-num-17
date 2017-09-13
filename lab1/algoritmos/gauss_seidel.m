function [x_sol, cant_iter, error_sol, ] = gauss_seidel(A, b, x0, max_iter, tol_estancamiento, tol_residuo)
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

  while (k < max_iter & error_estancamiento > tol_estancamiento & error_sol > tol_residuo)

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
    error_estancamiento = norm(xk - x_anterior);
    error_residuo = norm(A * xk - b);

    x_anterior = xk;
  end

  cant_iter = k;
  x_sol = xk;
end