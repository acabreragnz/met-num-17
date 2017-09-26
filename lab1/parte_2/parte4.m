sistema = load('./../sistemas_reales/nasa1824');
addpath(genpath('./../algoritmos'));

A = sistema.Problem.A;
b = sistema.Problem.b;

x_inicial = zeros(length(b), 1);

tic();

[x, cantIter, xk] = gauss_seidel(A, b, x_inicial, 100, 0.001);

cantIter

tiempo_de_ejecucion = toc()

sol_octave = A\b;

sol_octave(1:5)

x(1:5)

error_absoluto_gs = zeros(cantIter, 1);
error_xk = zeros(cantIter, 1);

for i = 1:cantIter
   error_absoluto_gs(i) = norm(xk(:, i) - sol_octave);
   error_xk(i) = norm(A * xk(:, i) - b);
end

plot(1:cantIter, error_absoluto_gs, 'b');
ylabel('Error absoluto');
xlabel('Cantidad de iteraciones');
legend('Gauss-Seidel', 'location', 'northwest');
 
figure;

plot(1:cantIter, error_xk, 'b');
ylabel('Residuo');
xlabel('Cantidad de iteraciones');
legend('Gauss-Seidel', 'location', 'northwest');