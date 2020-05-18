# Active-Pneumatic-Damper-Adaptive-Control

The circulatory system can be comparable to a hydraulic system were the heart is represented by a pump, and the veins and arteries are represented by pipes. This comparison makes it easier to develop an adaptive control system to regulate pressure and flow inside veins and arteries in the face of unknown disturbances. The reason the heart is compared to a pump, is that when it contracts it pumps blood out at high pressure, and when it relaxes to be filled with blood it causes a drop in pressure of the blood in the veins and arteries, just like a pump does to water. This is known in biology as systole (at contraction) and diastole (at relaxation). To simplify the complex circulatory system for our analysis we will be using set up using a pump, two tanks, pipes, and pneumatic valves. The pump will feed water to a pipe that will fill the first tank inside which pressure will be measured and controlled by the flow of compressed air that is controlled by a pneumatic valve. The output water from the tank will be at constant desired flow rate and pressure. The controlled water flow in the pipes will then get redirected to the second tank were the same process is repeated before the water gets sucked back is to the pump. We will model our pipes as hydraulic resistances and impedance for simplicity. To introduce disturbances to our system we could reduce the power input to our pump, or even add clamps to our pipes to restrict water flow on different locations. The reason for using water instead of blood, other that convenience is that we cannot find a pump suited for blood on the market



<p align="center">
  <img src="https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/pictures/Pneumatic%20Damper.PNG">
  <br />
  Pneumatic damper diagram.
</p>

<p align="center">
  <img src="https://github.com/KouraniMEKA/Active-Pneumatic-Damper-Adaptive-Control/blob/master/pictures/Pressure%20Chamber.PNG">
  <br />
  Pneumatic damper diagram.
</p>
