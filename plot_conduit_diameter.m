function plot_conduit_diameter()
% Plot friction factor vs conduit diameter
d = linspace(0.01, 0.5, 100);
Re = 1e5;
e = 0.0001;
f = arrayfun(@(D) f_analytical(Re, e/D), d);
plot(d, f); xlabel('Diameter (m)'); ylabel('Friction Factor'); title('Friction Factor vs Diameter');
end
