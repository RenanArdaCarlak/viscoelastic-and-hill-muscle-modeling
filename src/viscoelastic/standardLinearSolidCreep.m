function strain = standardLinearSolidCreep(t, stress0, E1, E2, eta)
%STANDARDLINEARSOLIDCREEP Creep response of a standard linear solid.
%
%
% tau_c = eta*(E1+E2)/(E1*E2)
%
% strain(t) = (stress0/E1) * (1 - (E2/(E1 + E2)) * exp(-t/tau_c))

         validateattributes(t, {'numeric'}, {'real'});
         validateattributes(stress0, {'numeric'}, {'real', 'scalar'});
         validateattributes(E1, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(E2, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(eta, {'numeric'}, {'real', 'positive', 'scalar'});

         tau_c = eta*(E1+E2)/(E1*E2);
         strain = (stress0/E1) * (1 - (E2/(E1 + E2)) * exp(-t/tau_c));
end