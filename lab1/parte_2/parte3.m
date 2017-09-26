sistema = load('./../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

x_inicial = zeros(length(b), 1);

addpath(genpath('./../algoritmos'));

tic();

[x, cantIter, xk] = jacobi(A, b, x_inicial, 100, 0.1);

cantIter

tiempo_de_ejecucion = toc()

sol_octave = A\b;

sol_octave(1:5)

x(1:5)

cantIter = 65;

error_absoluto_jacobi = zeros(cantIter, 1);
error_xk = zeros(cantIter, 1);

for i = 1:cantIter
   error_absoluto_jacobi(i) = norm(xk(:, i) - sol_octave);
   error_xk(i) = norm(A * xk(:, i) - b);
end

plot(1:cantIter, error_absoluto_jacobi, 'b');
ylabel('Error absoluto');
xlabel('Cantidad de iteraciones');
legend('Jacobi', 'location', 'northwest');
 
figure;

plot(1:cantIter, error_xk, 'b');
ylabel('Residuo');
xlabel('Cantidad de iteraciones');
legend('Jacobi', 'location', 'northwest');