% dado que hallar los c puede ser costoso, esta funcion permite no recalcularlos
function value = newton_interpol_from_coef(point, c, x)
  prod = newton_productoria(point, x)';

  value = c * prod;
end
