function strain = kelvinVoigtCreep(t, stress0, E, eta)
%KELVINVOIGTCREEP Creep response of a Kelvin-Voigt body under constant stress.
%
% strain(t) = stress0/E * (1 - exp(-E*t/eta))

         validateattributes(t, {'numeric'}, {'real'});
         validateattributes(stress0, {'numeric'}, {'real', 'scalar'});
         validateattributes(E, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(eta, {'numeric'}, {'real', 'positive', 'scalar'});

         strain = (stress0./E).*(1 - exp(-(E./eta).*t));
end
