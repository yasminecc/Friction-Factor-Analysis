function plot_pipe_roughness()
% Plot friction factor vs pipe roughness
e = linspace(1e-6, 5e-4, 100);
D = 0.05;
Re = 1e5;
f = arrayfun(@(r) f_analytical(Re, r/D), e);
plot(e, f); xlabel('Roughness (m)'); ylabel('Friction Factor'); title('Friction Factor vs Roughness');
end
