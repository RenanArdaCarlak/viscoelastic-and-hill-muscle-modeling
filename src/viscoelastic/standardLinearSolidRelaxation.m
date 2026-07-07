function stress = standardLinearSolidRelaxation(t, strain0, E1, E2, eta)
%STANDARDLINEARSOLIDRELAXATION Relaxation response of a standard linear solid.
%
% stress(t) = strain0 * (E1 + E2*exp(-E2*t/eta))

         validateattributes(t, {'numeric'}, {'real'});
         validateattributes(strain0, {'numeric'}, {'real', 'scalar'});
         validateattributes(E1, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(E2, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(eta, {'numeric'}, {'real', 'positive', 'scalar'});

         stress = strain0.*(E1 + E2.*exp(-(E2./eta).*t));
end
