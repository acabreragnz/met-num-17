% Devuelve un vector con los coeficientes del polinomio de confiabilidad
% del grafo G aproximado mediante el método F-Monte Carlo con N iteraciones
% G se expresa mediante su matriz de adyacencia

function F = fmc(G, N)
  % Indexamos las aristas utilizando el triangulo superior de G porque el grafo es no dirigido
  aristas = find(triu(G, 1));
  m = numEdges(G) - selfLoops(G);

  % Para cada i, calcular el coeficiente Fi
  for i=1:m
    i;
    F(i) = 0;

	% Sortear N subgrafos resultantes de quitar i aristas de G
    for k=1:N
      k;

      % Seleccionar aleatoriamente i aristas dentro de las m
      x = randperm(m,i);
      aristas_borrar = aristas(x);

      % Borrar las aristas seleccionadas y recomponer el subgrafo
      subG = triu(G);
      subG(aristas_borrar) = 0;
      subG = subG + tril(subG.', -1);

      % Verificar si el subgrafo es conexo y sumarlo a Fi
      F(i) += isConnected(subG);

    endfor

   	% En este momento, Fi coincide con la cantidad de subgrafos conexos
   	% dentro de los sorteados. Para completar la aproximación debemos
   	% multiplicar por el coeficiente indicado.

    F(i) *= nchoosek(m, i)/N;

  endfor

  % Agregamos el caso i = 0, en el G es el único subgrafo resultante de quitar
  % 0 aristas de G y, por hipótesis, es conexo. Observar que luego de esto
  % la posición i del vector contiene el (i-1)-ésimo coeficiente del polinomio.
  % Esto es, F0 = F(1), F1 = F(2), etc.

  F = [1, F];
endfunction
