%RUN_SMOKE_TESTS Basic numerical checks for the repository functions.

repoRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(fullfile(repoRoot, 'src')));

% Fourier/Laplace functions should be finite away from singularities.
w = [-3 -2 0 2 3];
sineValues = fourierSineMagnitude(w);
assert(all(isfinite(sineValues)), 'Fourier sine values should be finite away from omega = +/-1.');

s = 0 + 1i*[-3 0 3];
laplaceValues = dampedCosineLaplace(s);
assert(all(isfinite(laplaceValues)), 'Laplace values should be finite for the sampled points.');

% Viscoelastic response sanity checks.
t = [0 0.5 1.0];
maxwell = maxwellCreep(t, 100, 200, 50);
kelvin = kelvinVoigtCreep(t, 100, 200, 50);
assert(maxwell(1) == 0.5, 'Maxwell creep should start at stress/E.');
assert(kelvin(1) == 0, 'Kelvin-Voigt creep should start from zero strain under ideal stress step.');
assert(maxwell(end) > maxwell(1), 'Maxwell creep should increase under constant stress.');
assert(kelvin(end) > kelvin(1), 'Kelvin-Voigt creep should increase under constant stress.');

% Hill twitch response sanity checks.
params = hillDefaultParameters('baseline');
t = linspace(0, 1, 1000);
force = hillTwitchImpulse(t, params);
assert(all(isfinite(force)), 'Twitch force should be finite.');
assert(abs(force(1)) < 1e-10, 'Twitch response should start from zero.');
assert(max(force) > 0, 'Twitch response should contain a positive force peak.');

[timeTrain, forceTrain] = simulateTwitchTrain(10, 1.0, 0.001, params);
assert(numel(timeTrain) == numel(forceTrain), 'Twitch-train time and force arrays must match.');
assert(max(forceTrain) >= max(force), 'Repeated twitch train should not be smaller than every single-twitch peak.');

disp('All smoke tests passed.');
