# Solar-System
Simulation of our solar system

# Description

The system will be simulated with a Verlet velocity integration algorithm, a fast numerical method to integrate Newton's law of motion.
The file "posicion.txt", "masa.txt" and "velocidad.txt" are real values calculated using the known motion of the planets.
Mass is given in solar mass and distance is given in astronomic units. One unit of time is approximately 58 days. 



# How to use:

To run the simulation you have to follow these steps:

1. Compile sistsol.f with a fortran compiler

2. Copy the .txt file named "output.txt" to the "Ploter" folder

3. Run "Ploter.pde".

Alternatively, if you don't want to compile the fortran file and/or don't have processing on your computer, you can run "sistsol.exe" and then "ploter.exe", both located in the folder "Full"

# Parameters used

You can change the time step in the simulation by changing the second number in the file "param.txt" (currently in 0.05).
The maximum time of the simulation can also be changed by altering the first number in the previous file (currently 500).
