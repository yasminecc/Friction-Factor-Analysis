
---

## `report.md` 

```markdown
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
\[
Re = \frac{\rho \cdot V \cdot D}{\mu}
\]  
(Re must be > 4000 for valid calculations)

**Analytical Friction Factor:**  
\[
f = \frac{1.325}{\left[\log\left(\frac{e}{3.7D} + \frac{5.74}{Re^{0.9}}\right)\right]^2}
\]

**Colebrook Equation for Numerical Method (Bisection):**  
Solves:
\[
\frac{1}{\sqrt{f}} + 2 \log_{10}\left( \frac{e}{3.7D} + \frac{2.51}{Re\sqrt{f}} \right) = 0
\]

---

## Step 3: Test Cases

**Test 1:** Numerical vs Analytical calculation  
**Test 2:** Plot: Friction factor vs Conduit Diameter  
**Test 3:** Plot: Friction factor vs Pipe Roughness  
**Test 4:** Plot: Friction factor vs Fluid Density  
**Test 5:** Plot: Friction factor vs Dynamic Viscosity  
**Test 6:** Menu exits on non-1–5 input  
**Test 7:** Validation error when Re < 4000

---

## Step 4: MATLAB Implementation

### `menu.m`:
- Interactive menu for all five experiments
- Handles input validation, plotting, and saving graphs

### `Re.m`:
```matlab
function [R] = Re(dens, vel, diam, visc)
R = (dens * vel * diam) / visc;
end
