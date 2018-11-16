# Co-op-Data-Analysis
This is a compilation of data analysis during time of research in nanophotonics at the University of Milan's Department of Physics. The data used is reflective of the dimensions that make up given materials and how much light they absorb based on the wavelength of the incident light.

The "Error in Co-op Functions.R" file is used to calculate the errors that occur when either the known real or known imaginary refractive indices are put through the Kramers-Kronig function.

    The Kramers-Kronig function can be found in the following files:
    
    "Test_n_function.m" and "Test_k_function.m" are the functions used to put the refractive indices of known materials to the      test to see how accurate the function will perform come time to use custom values.
    "Test_n_function.m" solves for n (real) values and "Test_k_function.m" solves for k (imaginary) values
    
    "n_function.m" is used with custom k values to find n values and "k_function.m" is used with custom n values to find k          values
    
    
    
The "n function analysis.R" file uses the simulation results from five custom-made n functions (with their calculated k values) to create plots and visuals.

The "k function analysis.R" file uses the simulation results from five custom-made k functions (with their calculated n values) to create plots and visuals.
