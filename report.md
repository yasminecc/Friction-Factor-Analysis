# Friction Factor Analysis – Project Report

## Step 1: Problem Identification and Statement

Determine the flow characteristics in pipes by calculating the friction factor using:
- Analytical method
- Numerical (bisection) method

Visualize how:
- Conduit diameter  
- Pipe roughness  
- Fluid density  
- Dynamic viscosity  

affect the friction factor.

---

## Step 2: Key Equations and Inputs

**Reynolds Number:**  
`Re = (ρ * V * D) / μ`  
(*Re must be greater than 4000 for valid calculations*)

**Analytical Friction Factor:**  
`f = 1.325 / [log((e / 3.7D) + (5.74 / Re^0.9))]^2`

**Colebrook Equation (Numerical Bisection Method):**  
Solves for `f` using:
`1 / sqrt(f) + 2 * log10((e / 3.7D) + (2.51 / (Re * sqrt(f)))) = 0`

---

## Step 3: Test Cases

- **Test 1:** Compare numerical vs analytical friction factor  
- **Test 2:** Plot friction factor vs conduit diameter  
- **Test 3:** Plot friction factor vs pipe roughness  
- **Test 4:** Plot friction factor vs fluid density  
- **Test 5:** Plot friction factor vs dynamic viscosity  
- **Test 6:** Menu exits cleanly on non-1–5 input  
- **Test 7:** Rejection and error message when Re < 4000

---

## Step 4: MATLAB Implementation

### `menu.m`
- Provides interactive menu interface
- Handles:
  - Input validation
  - Friction factor calculation
  - Plotting and saving figures

### `Re.m`
```matlab
function [R] = Re(dens, vel, diam, visc)
    R = (dens * vel * diam) / visc;
end
