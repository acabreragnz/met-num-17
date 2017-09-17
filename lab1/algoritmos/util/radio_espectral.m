function rho = radio_espectral(Q)
  rho = max(abs(eig(Q)));
end
