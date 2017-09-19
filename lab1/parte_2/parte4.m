sistema = load('./../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

x_inicial = zeros[size(b)];

gauss_seidel = load('./../algoritmos/gauss_seidel');
gauss_seidel(A, b, x_inicial, 100, 0.1)