function demo_fourier_laplace(figDir)
%DEMO_FOURIER_LAPLACE Create Fourier/Laplace-domain demonstration plots.

         if nargin < 1
            figDir = pwd;
         end
 
         w = linspace(-10, 10, 4000);

         sineMag = abs(fourierSineMagnitude(w));
         sineMag(abs(1 - w.^2) < 0.02) = NaN;

         fig = figure('Visible', 'off');
         plot(w, sineMag, 'LineWidth', 1.5);
         xlabel('\omega');
         ylabel('|F(\omega)|');
         title('Fourier-transform magnitude of sin(t), one-sided convention');
         grid on;
         ylim([0 20]);
         exportgraphics(fig, fullfile(figDir, 'fourier_sine_magnitude.png'), 'Resolution', 300);
         close(fig);

         f = @(t) exp(-2*t).*cos(2*t);
         t = linspace(0, 10, 1000);

         fig = figure('Visible', 'off');
         plot(t, f(t), 'LineWidth', 1.5);
         xlabel('time');
         ylabel('f(t)');
         title('Damped cosine response: e^{-2t}cos(2t)');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'damped_cosine_time_response.png'), 'Resolution', 300);
         close(fig);

         g = dampedCosineFourier(w);

         fig = figure('Visible', 'off');
         plot(w, abs(g), 'LineWidth', 1.5);
         xlabel('\omega');
         ylabel('|G(\omega)|');
         title('Magnitude of Fourier-domain damped cosine response');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'damped_cosine_fourier_magnitude.png'), 'Resolution', 300);
         close(fig);

         sigma = linspace(-6, 6, 160);
         omega = linspace(-10, 10, 220);
         [Sigma, Omega] = meshgrid(sigma, omega);
         S = Sigma + 1i*Omega;
         laplaceMag = abs(dampedCosineLaplace(S));
         laplaceMag(laplaceMag > 4) = 4;

         fig = figure('Visible', 'off');
         surf(Sigma, Omega, laplaceMag, 'EdgeColor', 'none');
         xlabel('\sigma');
         ylabel('\omega');
         zlabel('|F(s)|');
         title('Laplace-domain magnitude surface for e^{-2t}cos(2t)');
         view(42, 28);
         grid on;
         exportgraphics(fig, fullfile(figDir, 'laplace_damped_cosine_surface.png'), 'Resolution', 300);
         close(fig);
end
