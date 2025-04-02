function plot_dynamic_viscosity()
% Plot friction factor vs dynamic viscosity
mu = linspace(0.0005, 0.003, 100);
rho = 1000;
D = 0.05;
V = 1.5;
Re = (rho * V * D) ./ mu;
e = 0.00005;
f = arrayfun(@(Re_val) f_analytical(Re_val, e/D), Re);
plot(mu, f); xlabel('Dynamic Viscosity (Pa.s)'); ylabel('Friction Factor'); title('Friction Factor vs Viscosity');
end
