more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

% p5 = p_graph(5);
% p10 = p_graph(10);
% p50 = p_graph(50);
%
% rango_p = 0:0.01:1;
%
% n = length(p50);
% m = n - 1;
%
% index = 0;
% for p = rango_p
%   index++;
%
%   confiab(index) = tutte_pol(p50, 1, p);
% end
%
% F_exacto = F_p_graph(length(p50));
%
% % graficando
% plot(rango_p, confiab, 'b');
% title('Confiabilidad (Rgp) de sustraccion contraccion para grafo tipo P5')
% ylabel('Confiabilidad');
% xlabel('probabilidad p de funcionamiento');

p3 = p_graph(3);
F_p3 = F_p_graph(3);

p = 0.3;
deletion_contraction(p3, p)
rp(p, F_p3)

c3 = c_graph(3);
F_c3 = F_c_graph(3);

p = 0.3;
deletion_contraction(c3, p)
rp(p, F_c3)

c4 = c_graph(4);
F_c4 = F_c_graph(4);

p = 0.3;
deletion_contraction(c4, p)
rp(p, F_c4)

F_otro = [1, 5, 4, 0, 0, 0];
otro = [0 1 0 1; 1 0 1 1; 0 1 0 1; 1 1 1 0];
p = 0.3;
deletion_contraction(otro, p)
rp(p, F_otro)
