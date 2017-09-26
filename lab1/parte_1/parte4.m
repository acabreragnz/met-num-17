% cargo los algoritmos
addpath(genpath('./../algoritmos'));

A = [29 34 -10; 34 41 -12; -10 -12 24];

b = [1; 2; 3];

q_j = q_jacobi(A)

r_j = r_jacobi(A, b)

vp = eig(q_jacobi(A))

radioEspectral = radio_espectral(q_jacobi(A))

x_inicial = [0; 0; 0];

tic();

[x, cantIter, xk] = jacobi(A, b, x_inicial, 100, 0.001);

tiempo_de_ejecucion = toc()
x

sol_octave = A\b

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