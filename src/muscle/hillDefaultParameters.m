function params = hillDefaultParameters(parameterSet)
%HILLDEFAULTPARAMETERS Return parameter sets used by the twitch model.
%
% parameterSet options:
%   'baseline'  : original baseline values from the educational model
%   'estimated' : alternative estimated mechanical parameters

    if nargin < 1
       parameterSet = 'baseline';
    end

    params.A1 = 1570;
    params.A2 = 1559;
    params.tau1 = 0.0326;
    params.tau2 = 0.0340;

    switch lower(parameterSet)
           case {'baseline', 'course'}
                params.kSE = 200;
                params.kPE = 50;
                params.b = 37.5;
           case 'estimated'
                params.kSE = 136;
                params.kPE = 75;
                params.b = 50;
           otherwise
                error('Unknown parameter set: %s', parameterSet);
    end
end
