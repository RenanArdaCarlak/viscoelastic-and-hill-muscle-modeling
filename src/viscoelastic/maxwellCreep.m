function strain = maxwellCreep(t, stress0, E, eta)
%MAXWELLCREEP Creep response of a Maxwell body under constant stress.
%
% strain(t) = stress0/E + stress0/eta*t

         validateattributes(t, {'numeric'}, {'real'});
         validateattributes(stress0, {'numeric'}, {'real', 'scalar'});
         validateattributes(E, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(eta, {'numeric'}, {'real', 'positive', 'scalar'});

         strain = stress0./E + (stress0./eta).*t;
end
