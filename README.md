# Design of a Solar Curve Tracer Using SEPIC Converter

## Overview
This project presents a compact, low-cost photovoltaic (PV) curve tracer that extracts the current-voltage (I-V) and power-voltage (P-V) characteristics of solar panels under real operating conditions. Developed for the EEE 460 Optoelectronics Laboratory at the Bangladesh University of Engineering and Technology (BUET), the system uses a Single-Ended Primary Inductor Converter (SEPIC) to replace bulky conventional resistive or capacitive loads.

By dynamically adjusting the duty cycle of the SEPIC converter, the system varies the equivalent input resistance seen by the PV module. This enables a smooth, automated sweep from near short-circuit current to near open-circuit voltage, capturing comprehensive performance data for 1.5 W and 15 W solar panels.

## Key Features
* **SEPIC-Based Electronic Load:** Utilizes a SEPIC DC-DC converter to emulate a variable input resistance, achieving fast and continuous curve tracing without output polarity inversion.
* **Integrated Sensing Platform:** Employs an INA219 sensor for precise voltage and current measurements (up to 30 V and 2 A) and a BH1750 light sensor calibrated for real-time irradiance estimation.
* **Automated Control & Acquisition:** An Arduino Uno controls the 20 kHz PWM duty cycle sweep and aggregates the sensor data.
* **Custom Hardware:** Implemented on a custom-designed PCB to eliminate loose wiring, reduce parasitic effects, and ensure stable operation.
* **Data Visualization:** Features a 20x4 LCD for real-time parameter display and MATLAB scripts for generating final I-V and P-V plots.

## Operating Principle
The core analysis relies on the SEPIC converter's ability to present a variable equivalent resistance, $R_{pv}$, to the PV module. The relationship between the converter's duty cycle ($D$), the output load resistance ($R_o$), and the PV-side resistance is defined as:
$R_{pv} = \left(\frac{1-D}{D}\right)^2 R_o$.
Sweeping the duty cycle changes $R_{pv}$, shifting the PV operating point across its entire nonlinear curve.

## Hardware Specifications
* **Microcontroller:** Arduino Uno
* **Converter Passive Elements:** Inductors: 1.3 mH, Input Capacitor: 47 $\mu$F, Output Capacitor: 10 $\mu$F
* **Sensors:** INA219 (Voltage/Current), BH1750 (Lux/Irradiance)
* **Switching Frequency:** 20 kHz

## Project Workflow
1. **Simulation:** The theoretical SEPIC-based tracer was first modeled and verified in MATLAB/Simulink to validate the duty-cycle sweep methodology and component sizing.
2. **Implementation:** The circuit was translated to a custom PCB, integrating the Arduino, sensors, MOSFET, and power resistors.
3. **Data Processing:** The Arduino outputs raw sweep data via serial communication, which is parsed by a custom MATLAB script to plot the curves and extract key parameters ($V_{oc}$, $I_{sc}$, $V_{mpp}$, $I_{mpp}$, $P_{mpp}$).
