function F = dampedCosineLaplace(s)
%DAMPEDCOSINELAPLACE Laplace transform of exp(-2t)*cos(2t), t >= 0.

         F = (s + 2) ./ (s.^2 + 4*s + 8);
end
