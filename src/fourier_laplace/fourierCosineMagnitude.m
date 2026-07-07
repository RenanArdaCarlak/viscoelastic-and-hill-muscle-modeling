function value = fourierCosineMagnitude(omega)
%FOURIERCOSINEMAGNITUDE Magnitude expression for the cos(t) transform example.
% The complex transform is j*omega/(1 - omega^2); the magnitude is |omega/(1-omega^2)|.

         value = abs(omega ./ (1 - omega.^2));
end
