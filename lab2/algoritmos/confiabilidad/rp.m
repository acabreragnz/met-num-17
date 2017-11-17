function confiabilidad = rp(p, F)
  cant_aristas = length(F) - 1;
  confiabilidad = 0;

  for i = 0:cant_aristas
    confiabilidad += F(i + 1) * p^(cant_aristas - i) * (1 - p)^i;
  end
end
