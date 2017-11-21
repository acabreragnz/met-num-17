function result = deletion_contraction(G, p)
  dim = size(G)(1);

  if isTree(G)
    cantidad_aristas = numEdges(G) - selfLoops(G);
    result = p^numEdges(G);
  elseif !isConnected(G)
    result = 0;
  elseif dim == 1
    result = 1;
  else
    [i, j] = elegir_abscisa(G);

    result = (1-p) * deletion_contraction(eliminar_arista(G, i, j), p) + p * deletion_contraction(contraer_arista(G, i, j), p);
  end
end

function [i, j] = elegir_abscisa(G)
  i = -1;
  j = -1;

  numero_aristas = numEdges(G) - selfLoops(G);

  if numero_aristas > 0
    aristas = find(G);
    random_num = randperm(length(aristas), 1);
    arista_elegida = aristas(random_num);

    i = ceil(arista_elegida / rows(G));
    j = mod(arista_elegida - 1, rows(G)) + 1;

    if (i == j)
      [i, j] = elegir_abscisa(G);
    end
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

function A = apagar_multi_links(A)
  dim = size(A)(1);

  for i=1:dim
    for j=1:dim
      if (A(i, j) > 1)
        A(i, j) = 1;
      end
    end
  end
end

function A = apagar_diagonal(A)
  A = A(logical(eye(size(A)))) = 0
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
