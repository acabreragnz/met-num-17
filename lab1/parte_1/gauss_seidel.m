function [x_sol, cant_iter] = gauss_seidel(A, b, x0, max_iter, tolerancia)
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
    error_absoluto = norm(xk - x_anterior);
    x_anterior = xk;
  end

  cant_iter = k;
  x_sol = xk;
end
