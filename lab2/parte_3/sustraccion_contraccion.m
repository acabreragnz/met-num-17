more off;
clear;
format long;

addpath(genpath('./../algoritmos'));
addpath(genpath('./../grafos'));

p5 = p_graph(5);
p10 = p_graph(10);
p50 = p_graph(50);

rango_p = 0:0.01:1;

n = length(p50);
m = n - 1;

index = 0;
for p = rango_p
  index++;

  confiab(index) = tutte_pol(p50, 1, p);
end

% graficando
plot(rango_p, confiab, 'b');
title('Confiabilidad (Rgp) de sustraccion contraccion para grafo tipo P5')
ylabel('Confiabilidad');
xlabel('probabilidad p de funcionamiento');
