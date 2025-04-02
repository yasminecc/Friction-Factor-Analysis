# Friction Factor Analysis in Pipes using MATLAB

This project analyzes the friction factor for fluid flow through pipes using both analytical and numerical methods (based on the Colebrook equation). It also generates graphical visualizations showing how various fluid and pipe properties affect the friction factor.

---

## Overview

- Analytical method uses an explicit formula
- Numerical method uses the **bisection method** to solve Colebrook’s equation
- Reynolds number is validated (must be > 4000 for turbulent flow)
- Input validation is applied to all fluid and pipe parameters
- Output includes friction factor values and graphical plots

---

## Files and Their Purpose

- `menu.m`:  
  The **main script** providing an interactive menu interface.  
  Allows users to choose between calculating the friction factor or plotting it against various parameters.
  
- `Re.m`:  
  A MATLAB **function** that computes the Reynolds number:
  \[
  Re = \frac{\rho \cdot V \cdot D}{\mu}
  \]

- `f.m`:  
  An **analytical function** to calculate the friction factor using:
  \[
  f = \frac{1.325}{\left[\log\left(\frac{e}{3.7D} + \frac{5.74}{Re^{0.9}}\right)\right]^2}
  \]

- `fnum.m`:  
  A **numerical function** that uses the bisection method to iteratively solve the Colebrook equation.

- `functions_from_report.m`:  
  Collection of code snippets and logic extracted from the report to support understanding.

- `report.md` or `report.docx`:  
  Full documentation of the problem, methodology, test cases, algorithm logic, and MATLAB code.

---

## How to Run

1. Open MATLAB and navigate to the project directory.
2. Run the main script:
   ```matlab
   menu
