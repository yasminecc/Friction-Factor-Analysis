function plot_fluid_density()
% Plot friction factor vs fluid density
rho = linspace(800, 1200, 100);
mu = 0.001;
D = 0.05;
V = 1.5;
Re = (rho .* V .* D) / mu;
e = 0.00005;
f = arrayfun(@(Re_val) f_analytical(Re_val, e/D), Re);
plot(rho, f); xlabel('Density (kg/m^3)'); ylabel('Friction Factor'); title('Friction Factor vs Fluid Density');
end
