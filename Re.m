%calculating Reynolds number

function [R] = Re(dens, vel, diam, visc)
R=(dens*vel*diam)/visc; 
end