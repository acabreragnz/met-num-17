sistema = load('./../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

x_inicial = zeros[size(b)];

jacobi = load('./../algoritmos/jacobi');
jacobi(A, b, x_inicial, 100, 0.1)