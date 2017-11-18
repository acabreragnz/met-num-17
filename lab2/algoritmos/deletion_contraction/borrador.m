more off;
clear;
format long;

e1 = [0 1 0 1; 1 0 1 1; 0 1 0 1; 1 1 1 0];

function result = tutte_pol(G, x, y)
  [i, j] = elegir_abscisa(G)

  if (i == -1) && (j == -1)
    result = 1;
  elseif is_bridge(G, i, j)
    result = x * tutte_pol(eliminar_arista(G, i, j), x, y);
  elseif is_loop(i, j)
    result = y * tutte_pol(contraer_arista(G, i, j), x, y);
  else
    result = tutte_pol(eliminar_arista(G, i, j), x, y) + tutte_pol(contraer_arista(G, i, j), x, y);
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
  G
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
    G
    g_aux = eliminar_arista(G, i, j)

    fila_i = g_aux(i, :);
    fila_j = g_aux(j, :);

    % suma la fila i a la j
    g_aux(j, :) += g_aux(i, :)

    columna_i = g_aux(:, i);
    columna_j = g_aux(:, j);

    % sumo la columna i a la j
    g_aux(:, j) += g_aux(:, i)

    % este elemento se suma dos veces por sumar fila y columna
    if g_aux(j, j) > 0
      g_aux(j, j) -= g_aux(i, j)
    end

    % saco la fila i
    g_aux(i, :) = []

    % saco la columna i
    g_aux(:, i) = []

    result = g_aux
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


% Calculate the number of connected components using the eigenvalues
%                   of the Laplacian - counting the number of zeros
%
% INPUTS: adjacency matrix, nxn
% OUTPUTs: positive integer - number of connected components
%
% Other routines used: graphSpectrum.m
% GB: last updated: September 22, 2012

function nc=numConnComp(adj)

s=graphSpectrum(adj);
nc=numel(find(s<10^(-5)));   % zero eigenvalues are sometimes close to zeros numerically

end

% The eigenvalues of the Laplacian of the graph.
%
% INPUTs: adjacency matrix, nxn
% OUTPUTs: laplacian eigenvalues, sorted
%
% Other routines used: laplacianMatrix.m
% GB: last updated, Oct 10 2012

function s=graphSpectrum(adj)

[~,D]=eig(laplacianMatrix(adj));
s=-sort(-diag(D)); % sort in decreasing order

end

% The Laplacian matrix defined for a *simple* graph
% Def: the difference b/w the diagonal degree and the adjacency matrices
% Note: This is not the normalized Laplacian
%
% INPUTS: adjacency matrix, nxn
% OUTPUTs: Laplacian matrix, nxn
%
% GB: last updated, Oct 10 2012

function L=laplacianMatrix(adj)

L=diag(sum(adj))-adj;


% NORMALIZED Laplacian .............

% def normLaplacianMatrix(adj):

% n=length(adj);
% deg = sum(adj); % for other than simple graphs,
%                     use [deg,~,~]=degrees(adj);

% L=zeros(n);
% edges=find(adj>0);
%
% for e=1:length(edges)
%     [ii,jj]=ind2sub([n,n],edges(e))
%     if ii==jj; L(ii,ii)=1; continue; end
%     L(ii,jj)=-1/sqrt(deg(ii)*deg(jj));
% end

end

% Return the total number of edges given the adjacency matrix
% INPUTs: adjacency matrix, nxn
% OUTPUTs: m - total number of edges/links
%
% Note: Valid for both directed and undirected, simple or general graph
% Other routines used: selfLoops.m, isSymmetric.m
% GB, last updated Sep 19, 2012

function m = numEdges(adj)

sl=selfLoops(adj); % counting the number of self-loops

if isSymmetric(adj) && sl==0    % undirected simple graph
    m=sum(sum(adj))/2;

elseif isSymmetric(adj) && sl>0
    m=(sum(sum(adj))-sl)/2+sl; % counting the self-loops only once

elseif not(isSymmetric(adj))   % directed graph (not necessarily simple)
    m=sum(sum(adj));

end

end

% Count the number of self-loops in the graph
%
% INPUT: adjacency matrix, nxn
% OUTPUT: integer, number of self-loops
%
% Note: in the adjacency matrix representation loops appear as non-zeros on the diagonal
% GB: last updated, Sep 20 2012

function sl=selfLoops(adj)

sl=sum(diag(adj));

end

% Checks whether a matrix is symmetric (has to be square).
%
% INPUTS: adjacency matrix, nxn
% OUTPUTS: boolean variable, {0,1}
%
% GB: last update, Sep 23, 2012

function S = isSymmetric(mat)

S = false; % default
if mat == transpose(mat); S = true; end
end


e2 = eliminar_arista(e1, 2, 4);
e3 = contraer_arista(e1, 2, 4);
e4 = contraer_arista(e2, 2, 3);
e5 = eliminar_arista(e3, 3, 1);
e6 = contraer_arista(e3, 3, 1);
e7 = contraer_arista(e4, 2, 3);

final_eliminado_e2 = eliminar_arista(e2, 2, 3);

final_eliminado_e4 = eliminar_arista(e4, 2, 3);

final_contraido_e5 = contraer_arista(e5, 3, 2);
final_eliminado_e5 = eliminar_arista(e5, 3, 2);

final_contraido_e6 = contraer_arista(e6, 1, 2);
final_eliminado_e6 = eliminar_arista(e6, 1, 2);

final_contraido_e7 = contraer_arista(e7, 1, 2);
final_eliminado_e7 = eliminar_arista(e7, 1, 2);
