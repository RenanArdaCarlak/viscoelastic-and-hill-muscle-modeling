function force = hillTwitchImpulse(t, params)
%HILLTWITCHIMPULSE Two-exponential Hill-type twitch impulse response.
%
% The response combines activation/deactivation exponentials with a mechanical
% time constant determined by serial elasticity, parallel elasticity, and damping.

         validateattributes(t, {'numeric'}, {'real'});
    
         requiredFields = {'A1', 'A2', 'tau1', 'tau2', 'kSE', 'kPE', 'b'};
         for idx = 1:numel(requiredFields)
             if ~isfield(params, requiredFields{idx})
                 error('Missing parameter field: %s', requiredFields{idx});
             end
         end
    
         tLocal = t;
         activeMask = tLocal >= 0;
         force = zeros(size(tLocal));

         kTotal = params.kSE + params.kPE;
         mechanicalDecay = exp(-(kTotal ./ params.b).*tLocal(activeMask));

         term1Coefficient = params.A1 * (params.kSE ./ (params.tau1*kTotal - params.b));
         term2Coefficient = params.A2 * (params.kSE ./ (params.tau2*kTotal - params.b));

         term1 = term1Coefficient .* (exp(-tLocal(activeMask)./params.tau1) - mechanicalDecay);
         term2 = term2Coefficient .* (exp(-tLocal(activeMask)./params.tau2) - mechanicalDecay);

         force(activeMask) = term1 - term2;
end
