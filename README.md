# IRD-IRV-Seismic-Design

This repository contains MATLAB functions and examples for calculating **Inelastic Displacement Ratio (IR<sub>D</sub>)** and **Inelastic Velocity Ratio (IR<sub>V</sub>)** in seismic design. These metrics are commonly used in structural engineering to assess the nonlinear behavior of single-degree-of-freedom (SDOF) systems under earthquake loading.

## Folder Structure
    .
    ├── IRD.m                   # MATLAB function for GUI to compute IRD
    ├── IRV.m                   # MATLAB function for GUI to compute IRV
    ├── DesignExample.md        # Step-by-step design example using IRD and IRV
    └── README.md




## Functions

### `IRD.m`
This MATLAB function provides a **graphical user interface (GUI)** to compute the **Inelastic Displacement Ratio (IR<sub>D</sub>)** for single-degree-of-freedom (SDOF) systems subjected to seismic loading.

### Description

The IR<sub>D</sub> calculation is based on the following parameters:

- **Damping Ratio (%)** - Select from 5, 10, 20, 30, 40, or 50%.
- **Ground Motion Type** - Options: FD, FS, or combined FD+FS.
- **Ductility (μ)** - Input the ductility factor.
- **Effective Period (T<sub>e</sub>)** - Input the effective period of the system.

### Usage

1. Run `IRD.m` in MATLAB.
2. Select the damping ratio and ground motion type from the dropdown menus.
3. Enter the ductility (μ) and effective period (Te) in the text boxes.
4. Click **Compute IRD** to display the calculated IR<sub>D</sub> value.

### `IRV.m`
This MATLAB function provides a **graphical user interface (GUI)** to compute the **Inelastic Velocity Ratio (IR<sub>V</sub>)** for single-degree-of-freedom (SDOF) systems subjected to seismic loading.

### Description

The IR<sub>V</sub> calculation is based on the following parameters:

- **Damping Ratio (%)** - Select from 5, 10, 20, 30, 40, or 50%.
- **Ground Motion Type** - Options: FD, FS, or combined FD+FS.
- **Ductility (μ)** - Input the ductility factor.
- **Effective Period (T<sub>e</sub>)** - Input the effective period of the system.


### Usage

1. Run `IRV.m` in MATLAB.
2. Select the damping ratio and ground motion type from the dropdown menus.
3. Enter the ductility (μ) and effective period (Te) in the text boxes.
4. Click **Compute IRV** to display the calculated IR<sub>V</sub> value.

### Requirements

- MATLAB R2016a or later

## Design Example

The `DesignExample.md` file provides an example that demonstrates the calculation of **design forces for an equivalent single-degree-of-freedom (SDOF) system** using both:

1. The conventional procedure by **Sullivan & Lago (2012)**  
2. The **proposed ML-based method** for estimating inelastic displacement and velocity ratios (IR<sub>D</sub> and IR<sub>V</sub>)




## References

- Sullivan, T. J., & Lago, A. (2012). *Towards a simplified direct DBD procedure for the seismic design of moment resisting frames with viscous dampers*. Engineering Structures, 35, 140-148.

