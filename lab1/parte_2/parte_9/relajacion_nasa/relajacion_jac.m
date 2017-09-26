more off;

clear;
format long;

% cargo los algoritmos
addpath(genpath('./../../../algoritmos'));

sistema = load('./../../../sistemas_reales/nasa1824');
A = sistema.Problem.A;
b = sistema.Problem.b;

% % Jacobi no converge, esto se deberia poder asumir tambien por la parte 2.3
% rho = radio_espectral(q_jacobi(A))
%
% % w optimo para aplicar jor
% w_opt = inf;
% rho_opt = inf;
%
% % subrelajacion para obtener convergencia
% for w=0.1:0.1:1
%   rho = radio_espectral(q_jor(A, w));
%
%   if (rho_opt > rho)
%     rho_opt = rho;
%     w_opt = w;
%   end
% end
%
% w_opt
% rho_opt

% w_optimo es 0.3
tic()
[ll, mm, nn] = jor_mejorado(A, b, ones(length(b), 1), 0.3, 1000, 0.01);
toc()

hold on;
grid on;

sol_octave = A \ b;

error_absolut_jor = [];

cant_iter = mm;

for i = 1:cant_iter
  error_absolut_jor(i) = norm(nn(:, i) - sol_octave);
end

plot(1:cant_iter, error_absolut_jor, 'b');
ylabel('Error absoluto');
xlabel('Cantidad de iteraciones');
legend('JOR', 'location', 'northwest');
