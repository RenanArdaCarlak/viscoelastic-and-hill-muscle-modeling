function stress = maxwellStressRelaxation(t, strain0, E, eta)
%MAXWELLSTRESSRELAXATION Stress relaxation of a Maxwell body after step strain.
%
% stress(t) = E*strain0*exp(-E*t/eta)

         validateattributes(t, {'numeric'}, {'real'});
         validateattributes(strain0, {'numeric'}, {'real', 'scalar'});
         validateattributes(E, {'numeric'}, {'real', 'positive', 'scalar'});
         validateattributes(eta, {'numeric'}, {'real', 'positive', 'scalar'});

         stress = E.*strain0.*exp(-(E./eta).*t);
end
