function result = tutte_pol(G, x, y)
  [i, j] = elegir_abscisa(G);

  if (i == -1) && (j == -1)
    result = 1;
  elseif is_bridge(G, i, j)
    result = x * tutte_pol(eliminar_arista(G, i, j), x, y);
  elseif is_loop(i, j)
    result = y * tutte_pol(contraer_arista(G, i, j), x, y);
  else
    result = (1-y) * tutte_pol(eliminar_arista(G, i, j), x, y) + y * tutte_pol(contraer_arista(G, i, j), x, y);
  end
end

function [i, j] = elegir_abscisa(G)
  i = -1;
  j = -1;

  if numEdges(G) > 0
    aristas = find(G);
    random_num = randperm(length(aristas), 1);
    arista_elegida = aristas(random_num);

    i = ceil(arista_elegida / rows(G));
    j = mod(arista_elegida - 1, rows(G)) + 1;
  end
end

function value = is_loop(i, j)
  value = i == j;
end

function value = is_bridge(G, i, j)
  numero_actual_componentes_conexas = numConnComp(G);

  g_aux = eliminar_arista(G, i, j);

  numero_siguiente_componentes_conexas = numConnComp(g_aux);

  value = numero_siguiente_componentes_conexas > numero_actual_componentes_conexas;
end

function result = contraer_arista(G, i, j)

  % en caso de loopbs no queremos eliminar filas ni columnas solo restar
  if i == j
    result = eliminar_arista(G, i, j);
  else
    G;
    g_base = eliminar_arista(G, i, j);
    g_aux = g_base;

    fila_i = g_base(i, :);
    fila_j = g_base(j, :);

    % suma la fila i a la j
    g_aux(j, :) += g_base(i, :);

    columna_i = g_base(:, i);
    columna_j = g_base(:, j);

    % sumo la columna i a la j
    g_aux(:, j) += g_base(:, i);

    % este elemento se suma dos veces por sumar fila y columna
    if g_aux(j, j) > 0
      g_aux(j, j) -= g_base(i, j);
    end

    % saco la fila i
    g_aux(i, :) = [];

    % saco la columna i
    g_aux(:, i) = [];

    result = g_aux;
  end
end

function result = eliminar_arista(G, i, j)
  g_aux = G;

  if (g_aux(i, j) > 0)
    g_aux(i, j) -= 1;
  end

  % en caso loop no debo restar doble
  if i != j
    g_aux(j, i) -= 1;
  end

  result = g_aux;
end

% Ejemplo usado como test tomado del documento tesis
% e1 = [0 1 0 1; 1 0 1 1; 0 1 0 1; 1 1 1 0];
% e2 = eliminar_arista(e1, 2, 4);
% e3 = contraer_arista(e1, 2, 4);
% e4 = contraer_arista(e2, 2, 3);
% e5 = eliminar_arista(e3, 3, 1);
% e6 = contraer_arista(e3, 3, 1);
% e7 = contraer_arista(e4, 2, 3);
%
% final_eliminado_e2 = eliminar_arista(e2, 2, 3);
%
% final_eliminado_e4 = eliminar_arista(e4, 2, 3);
%
% final_contraido_e5 = contraer_arista(e5, 3, 2);
% final_eliminado_e5 = eliminar_arista(e5, 3, 2);
%
% final_contraido_e6 = contraer_arista(e6, 1, 2);
% final_eliminado_e6 = eliminar_arista(e6, 1, 2);
%
% final_contraido_e7 = contraer_arista(e7, 1, 2);
% final_eliminado_e7 = eliminar_arista(e7, 1, 2);
