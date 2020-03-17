# Ternary_Phase_Diagram
Plotting the different elements of ternary phase diagrams


# Installation
Just download the scripts or the compressed file and extract to your MATLAB folder


# Overview
Read the tri_example.m file and run to see the different functions and features of the code.


# Examples


## Preparing the system model
define different relations

The system calcluated here is Water-Ethanol-Acetone

Vapor pressure is calculated using Antoine relation

In this example the system is considered IDEAL.

In reality this is not the case, an azeotrope exists!

Try to calculate the system using a non-ideal model (e.g. Wilson) to appreciate the difference

### define vapor pressure relations as function of temperature

`p_a = @(T) 10.^(8.07131-1730.63./(233.426+T));`

`p_b = @(T) 10.^(8.20417 - 1642.89 ./ (230.3 + T));`

`p_c = @(T) 10.^(7.1327-1219.97./(230.653+T));`

### define liquidus and vaporus surface equations as function of composition and temperature

`p_liq = @(x_a, x_b, x_c, T) 760 - (x_a.*p_a(T) + x_b.*p_b(T) + x_c.*p_c(T));`

`p_vap = @(x_a,x_b,x_c,T) 1000*(1/760 - (x_a./p_a(T) + x_b./p_b(T) + x_c./p_c(T)));`


## Create an empty ternary plot

### >> tri_base(n, z_max, grid)

where,

n: number of points in the range 0:1

z_max: maximum value of the Z/vertical axis

grid: boolean (true/false) for showing grid on the ternary triangle

`tri_base(11, 120, true);`


## Plot liquidus and vaporus surfaces

### >> tri_surf(func, n)

where,

func: surface function with arguments @(x_a, x_b, x_c, T)

n: number of points in the range 0:1

`tri_surf(p_liq,11);`

`tri_surf(p_vap,11);`


## Plot an isotherm

### >> tri_isotherm(z, n, grid, a)

where,

z: temperature of the isothermal section

n: number of points in the range 0:1

grid: boolean (true/false) for showing grid on the isotherm

a: surface opacity of isothermal section (value betwen 0:1)

`tri_isotherm(80,11,false,0.8);`
