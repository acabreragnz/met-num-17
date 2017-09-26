more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../../../algoritmos'));

sistema = load('./../../../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

n = 500;

tic()
[l, m, r] = gauss_seidel(A, b, zeros(length(b), 1), n, 0.00000001);
toc()

tic()
[ll, mm, rr] = sor(A, b, zeros(length(b), 1), 1.84101, n, 0.00000001);
toc()

hold on;
grid on;

sol_octave = A \ b;

error_absoluto_gs = zeros(n, 1);
error_absolut_sor = [];

for i = 1:n
  error_absoluto_gs(i) = norm(r(:, i) - sol_octave);
  error_absolut_sor(i) = norm(rr(:, i) - sol_octave);
end

plot(1:n, error_absoluto_gs, 'b');
plot(1:n, error_absolut_sor, 'g');
ylabel('Error absoluto');
xlabel('Cantidad de iteraciones');
legend('Gauss-Seidel', 'SOR', 'location', 'northwest');

% axis ('labely','tic');
% set(gca,'yTickLabel',[10^-1 10^-2 10^-3 10^-4 10^-5] );
