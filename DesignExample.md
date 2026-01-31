# Design Example: Equivalent SDOF System

The design forces are calculated for an equivalent **single-degree-of-freedom (SDOF)** system with damping using the method of **Sullivan and Lago (2012)**[^1] and the **proposed ML-based method**. The results are compared with those obtained from **nonlinear response history analysis (NLRHA)**.

---

## SDOF Parameters

The equivalent SDOF system parameters used for the verification of the proposed procedure are summarized below:

- **Peak (target) displacement**, Δ<sub>d</sub> (mm): 70  
- **Peak yield displacement**, Δ<sub>y</sub> (mm): 35  
- **Effective mass**, m<sub>e</sub> (kN): 1500  
- **Effective height**, H<sub>e</sub> (m): 3.5  
- **Additional viscous damping from dampers**, ξ<sub>d</sub> (%): 25  
- **Inherent damping**, ξ<sub>h</sub> (%): 5  

---

## Calculation Using the Conventional Method

### Step 1: Ductility

$$
\mu = \frac{\Delta_d}{\Delta_y} = \frac{70}{35} = 2
$$

---

### Step 2: Total Equivalent Viscous Damping

Taking the fractional damping component as ξ<sub>fra</sub> = 13.53%:



$$
\xi_{eq} = \xi_h + \xi_{fra} + \xi_d = 5\\% + 13.53\\% + 25\\% = 43.53\\%
$$




---

### Step 3: Damping Reduction Factor

The damping reduction factor (η) is calculated and used to scale the displacement response spectrum.  
The design response spectrum is constructed considering **high seismicity**, **Type 1 spectrum**, and **ground type C** (CEN, 2004).



$$
\eta = \left(\frac{10}{5 + \xi_{eq}}\right)^{0.5} 
       = \left(\frac{10}{5 + 43.53}\right)^{0.5} 
       = 0.454
$$

---

### Step 4: Effective Period and Secant Stiffness

The effective period corresponding to the scaled displacement spectrum for  the corresponding peak (target) displacement Δ<sub>d</sub> = 70 mm is:

$$
T_{eff} = 0.945 \text{ s}
$$



The secant stiffness is then:

$$K_{eff} = \frac{4\pi^2}{T_{eff}^2} = \frac{4\pi^2}{0.945^2} = 6765.817 \text{ kN/m}$$


---

### Step 5: Design Lateral Force

$$
V_b = K_{eff} \cdot \Delta_d = 473.61 \text{ kN}
$$

---

### Step 6: Maximum Damping Force

$$
PL^{-max} = 2 \cdot \xi_d \cdot V_b = 2 \cdot 0.25 \cdot 473.61 = 236.80 \text{ kN}
$$

---

## Calculation Using the Proposed Method

### Step 1: Ductility

$$
\mu = \frac{\Delta_d}{\Delta_y} = \frac{70}{35} = 2
$$

---

### Step 2: Total Equivalent Viscous Damping

$$
\xi_{eq} = \xi_h + \xi_d = 5\\% + 25\\% = 30\\%
$$

---

### Step 3: Damping Reduction Factor


$$
\eta = \left(\frac{10}{5 + \xi_{eq}}\right)^{0.5} 
       = \left(\frac{10}{5 + 30}\right)^{0.5} 
       = 0.534
$$

---

### Step 4: Effective Period and Elastic Stiffness

The effective period corresponding to Δ<sub>d</sub> = 70 mm in the scaled displacement spectrum is:

$$
T_e = 0.647 \text{ s}
$$

The corresponding elastic stiffness is:

$$K_e = \frac{4\pi^2}{T_e^2} = \frac{4\pi^2}{0.647^2} = 14403.43 \text{ kN/m}$$


---

### Step 5: ML-Based Inelastic Ratios

Based on the best-performing ML model (**TabPFN**):

- **Inelastic displacement ratio**, IR<sub>D</sub> = 1.092  
- **Inelastic velocity ratio**, IR<sub>V</sub> = 0.918  

---

### Step 6: Design Base Shear

$$
V_b = K_e \cdot \Delta_y = 14403.43 \cdot 0.035 = 504.12 \text{ kN}
$$

The elastic base shear is:

$$
V_{el} = \frac{K_e \cdot \Delta_d}{IR_D} = \frac{14403.43 \cdot 0.070}{1.092} = 923.3 \text{ kN}
$$

---

### Step 7: Maximum Damping Force

$$
PL^{-max} = 2 \cdot \xi_d \cdot V_{el} \cdot IR_V
$$

$$
PL^{-max} = 2 \cdot 0.25 \cdot 923.3 \cdot 0.918 = 423.8 \text{ kN}
$$

---

## Remarks

- The design values of the equivalent lateral force **V<sub>b</sub>** and the viscous damping force **$$PL^{-max}$$** obtained using the **proposed method** and the **conventional method** are summarized in the final steps of each calculation procedure.
- The IR<sub>D</sub> and IR<sub>V</sub> are calculated using empirical equations.


---

[^1]: Sullivan, T. J., & Lago, A. (2012). *Towards a simplified direct DBD procedure for the seismic design of moment resisting frames with viscous dampers*. Engineering Structures, 35, 140–148.
