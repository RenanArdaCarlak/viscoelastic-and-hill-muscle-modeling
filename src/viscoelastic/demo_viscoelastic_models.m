function demo_viscoelastic_models(figDir)
%DEMO_VISCOELASTIC_MODELS Generate representative viscoelastic step responses.

         if nargin < 1
            figDir = pwd;
         end

         t = linspace(0, 8, 1000);

         E = 200;
         eta = 50;
         stress0 = 100;
         strain0 = 0.5;

         maxwellCreepResponse = maxwellCreep(t, stress0, E, eta);
         kelvinCreepResponse = kelvinVoigtCreep(t, stress0, E, eta);
         maxwellRelaxation = maxwellStressRelaxation(t, strain0, E, eta);

         E1 = 75;
         E2 = 200;
         slsCreepResponse = standardLinearSolidCreep(t, stress0, E1, E2, eta);
         slsRelaxation = standardLinearSolidRelaxation(t, strain0, E1, E2, eta);

         fig = figure('Visible', 'off');
         plot(t, maxwellCreepResponse, 'LineWidth', 1.5, 'DisplayName', 'Maxwell creep');
         hold on;
         plot(t, kelvinCreepResponse, 'LineWidth', 1.5, 'DisplayName', 'Kelvin-Voigt creep');
         plot(t, slsCreepResponse, 'LineWidth', 1.5, 'DisplayName', 'SLS creep' );
         xlabel('time');
         ylabel('strain');
         title('Creep response under constant stress');
         legend('Location', 'best');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'viscoelastic_creep_responses.png'), 'Resolution', 300);
         close(fig);

         fig = figure('Visible', 'off');
         plot(t, maxwellRelaxation, 'LineWidth', 1.5, 'DisplayName', 'Maxwell relaxation');
         hold on;
         plot(t, slsRelaxation, 'LineWidth', 1.5, 'DisplayName', 'Standard linear solid relaxation');
         xlabel('time');
         ylabel('stress');
         title('Stress relaxation under constant strain');
         legend('Location', 'best');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'viscoelastic_relaxation_responses.png'), 'Resolution', 300);
         close(fig);

         fig = figure('Visible', 'off');
         yyaxis left;
         plot(t, maxwellCreepResponse, 'LineWidth', 1.5, 'DisplayName', 'Maxwell creep');
         hold on;
         plot(t, kelvinCreepResponse, 'LineWidth', 1.5, 'DisplayName', 'Kelvin-Voigt creep');
         plot(t, slsCreepResponse, 'LineWidth', 1.5, 'DisplayName', 'SLS creep' );
         ylabel('strain');
         yyaxis right;
         plot(t, maxwellRelaxation, '-.', 'LineWidth', 1.5, 'DisplayName', 'Maxwell relaxation');
         plot(t, slsRelaxation, '--', 'LineWidth', 1.5, 'DisplayName', 'SLS relaxation');
         ylabel('stress');
         xlabel('time');
         title('Representative viscoelastic step responses');
         legend('Location', 'best');
         grid on;
         exportgraphics(fig, fullfile(figDir, 'viscoelastic_step_responses.png'), 'Resolution', 300);
         close(fig);
end
