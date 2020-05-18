# Active-Pneumatic-Damper-Adaptive-Control

The circulatory system can be comparable to a hydraulic system were the heart is represented by a pump, and the veins and arteries are represented by pipes. This comparison makes it easier to develop an adaptive control system to regulate pressure and flow inside veins and arteries in the face of unknown disturbances. The reason the heart is compared to a pump, is that when it contracts it pumps blood out at high pressure, and when it relaxes to be filled with blood it causes a drop in pressure of the blood in the veins and arteries, just like a pump does to water. This is known in biology as systole (at contraction) and diastole (at relaxation). To simplify the complex circulatory system for our analysis we will be using set up using a pump, two tanks, pipes, and pneumatic valves. The pump will feed water to a pipe that will fill the first tank inside which pressure will be measured and controlled by the flow of compressed air that is controlled by a pneumatic valve. The output water from the tank will be at constant desired flow rate and pressure. The controlled water flow in the pipes will then get redirected to the second tank were the same process is repeated before the water gets sucked back is to the pump. We will model our pipes as hydraulic resistances and impedance for simplicity. To introduce disturbances to our system we could reduce the power input to our pump, or even add clamps to our pipes to restrict water flow on different locations. The reason for using water instead of blood, other that convenience is that we cannot find a pump suited for blood on the market. <br />
<br />
Four controllers are presented: <br />
1. [Baseline Controller](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/tree/master/Simple_Controller_Nonlinear) (No adaptation), <br />
2. Direct Self-Tuning Regulator, [DSTR](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/tree/master/DSTR_Nonlinear) (adaptive 1), <br />
3. Indirect Self-Tuning Regulator, [ISTR](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/tree/master/ISTR_Nonlinear) (adaptive 2), <br />
4. Model Reference Adaptive Controller, [MRAC](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/tree/master/MRAC_output_feedback) (adaptive 3). <br />

<br />
[ ]()
A full [project report](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/Report_Active_Pneumatic_Damper.pdf) is included.
<br />
<br />

<p align="center">
  <img src="https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/pictures/Pneumatic%20Damper.PNG" width="425" height="264">
  <br />
  Pneumatic damper diagram.
</p>

<p align="center">
  <img src="https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/pictures/Pressure%20Chamber.PNG" width="245" height="250" >
  <br />
  Pressure chamber diagram.
</p>


# Prerequisites
MATLAB/Simulink software v2018a.

# How to use
1. Download the files. <br />
2. double click ["ActivePneumaticDamperAdaptiveControl.prj"](https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/TetheredUAVControl.prj) to open it in the MATLAB/Simulink environment. <br />
3. choose the desired control scheme folder (Simple_Controller_Nonlinear, DSTR_Nonlinear, ISTR_Nonlinear, MRAC_output_feedback)
4. Run the corresponding MATLAB script to load the parameters. <br />
5. Run the Simulink model to generate the results (results can be monitored in the scope elements). <br />
5. ... Edit the MATLAB script for your desiered scenario and parameters. <br />

# Sample results
<p align="center">
  <img src="https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/pictures/Output_error_baseline.JPG">
  <br />
  Output error based on the reference model for a [0,10] input square signal for the *simple* *controller* with the nonlinear model. 
</p>

<p align="center">
  <img src="https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/pictures/Output_error_adaptive.JPG">
  <br />
  Output error based on the reference model for a [0,10] input square signal for the *adaptive* *controller* with the nonlinear model.
</p>

# Authors
* **Ahmad Kourani** - *inital work* - [KouraniMEKA](https://github.com/KouraniMEKA).
* **Abdel-Rahman Koleilat**
* **Peter El Haddad** 

# License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/KouraniMEKA/Tethered-UAV-control/blob/master/LICENSE) file for details.
 
