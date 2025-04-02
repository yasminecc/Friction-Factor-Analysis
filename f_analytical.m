function f = f_analytical(Re, eD)
% Calculates friction factor using explicit equation (Swamee-Jain formula)
f = 0.25 / (log10(eD/3.7 + 5.74/Re^0.9))^2;
end
