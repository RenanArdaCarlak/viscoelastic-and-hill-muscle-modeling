function demo_hill_twitch_response(figDir)
%DEMO_HILL_TWITCH_RESPONSE Generate Hill-type twitch response figures.
    
         if nargin < 1
            figDir = pwd;
         end

         baseParams = hillDefaultParameters('baseline');
         estimatedParams = hillDefaultParameters('estimated');

         t = linspace(0, 1, 2000);
         forceBase = hillTwitchImpulse(t, baseParams);
         forceEstimated = hillTwitchImpulse(t, estimatedParams);

         fig = figure('Visible', 'off');
         plot(t, forceBase, 'LineWidth', 1.5, 'DisplayName', 'baseline parameter set');
         hold on;
         plot(t, forceEstimated, 'LineWidth', 1.5, 'DisplayName', 'estimated parameter set');
         xlabel('time (s)');
         ylabel('force response');
         title('Single Hill-type twitch impulse response');
         legend('Location', 'best');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'hill_single_twitch.png'), 'Resolution', 300);
         close(fig);

         frequencies = [1 10 20];
         fig = figure('Visible', 'off');
         hold on;
         for idx = 1:numel(frequencies)
             [time, force] = simulateTwitchTrain(frequencies(idx), 1.0, 0.0005, baseParams);
             plot(time, force, 'LineWidth', 1.3, 'DisplayName', sprintf('%d Hz', frequencies(idx)));
         end
         xlabel('time (s)');
         ylabel('force response');
         title('Hill-type twitch trains at different stimulation frequencies');
         legend('Location', 'best');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'hill_twitch_trains.png'), 'Resolution', 300);
         close(fig);
end
