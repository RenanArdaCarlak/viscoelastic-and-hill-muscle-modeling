function [time, force] = simulateTwitchTrain(stimulationFrequency, duration, dt, params)
%SIMULATETWITCHTRAIN Superpose twitch impulse responses at a stimulation frequency.
%
% [time, force] = simulateTwitchTrain(frequency, duration, dt, params)

         validateattributes(stimulationFrequency, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(duration, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(dt, {'numeric'}, {'real', 'positive', 'scalar'});

         time = 0:dt:duration;
         force = zeros(size(time));

         stimulationPeriod = 1 ./ stimulationFrequency;
         pulseTimes = 0:stimulationPeriod:duration;

         for pulseIdx = 1:numel(pulseTimes)
             shiftedTime = time - pulseTimes(pulseIdx);
             force = force + hillTwitchImpulse(shiftedTime, params);
         end
end
