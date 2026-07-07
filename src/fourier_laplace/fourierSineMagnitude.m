function value = fourierSineMagnitude(omega)
%FOURIERSINEMAGNITUDE One-sided transform magnitude expression for sin(t).
% The expression has singularities at omega = +/-1.

         value = 1 ./ (1 - omega.^2);
end
