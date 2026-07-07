function G = dampedCosineFourier(omega)
%DAMPEDCOSINEFOURIER Fourier-domain response for exp(-2t)*cos(2t), t >= 0.

         G = (2 + 1i*omega) ./ (8 - omega.^2 + 4i*omega);
end
