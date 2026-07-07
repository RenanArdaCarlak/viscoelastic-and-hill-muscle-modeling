function run_all_demos()
%RUN_ALL_DEMOS Generate representative figures for the repository.
%
% Run from repository root:
%   addpath(genpath('src'));
%   run_all_demos

         close all;

         repoRoot = fileparts(fileparts(mfilename('fullpath')));
         figDir = fullfile(repoRoot, 'figures');

         if ~exist(figDir, 'dir')
             mkdir(figDir);
         end

         addpath(genpath(fullfile(repoRoot, 'src')));

         demo_fourier_laplace(figDir);
         demo_viscoelastic_models(figDir);
         demo_hill_twitch_response(figDir);

         fprintf('Demo figures written to: %s\n', figDir);
end
