function c = diferencias_divididas(x, y)
  n = length(y) - 1;

  for i=0:n
    c(i+1, 1) = y(i+1);
  end

  for j=1:n
    for i=0:(n-j)
      c(i+1, j+1) = (c(i+2, j) - c(i+1, j)) / (x(i+j+1) - x(i+1));
    end
  end
end
