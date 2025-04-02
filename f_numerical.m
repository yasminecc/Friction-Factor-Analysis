function f = f_numerical(Re, eD)
% Calculates friction factor numerically using bisection method
f = bisection_method(@(f) 1/sqrt(f) + 2*log10(eD/3.7 + 2.51/(Re*sqrt(f))), 0.008, 0.1, 1e-6);
end
