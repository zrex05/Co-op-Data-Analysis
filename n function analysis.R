# Retrieve data for simulation results relating to the stepup, stepdown, triangular, high
# flat line, and low flat line custom n functions

n.results <- read.csv("n function results.csv")

# Create line graph showing the absorption for the five functions all together with respect
# to wavelength (in nm)

n.results.graph <- ggplot(data = n.results) + 
  geom_line(aes(x = Wavelength, y = Stepdown.abs, color = "Step Down")) +
  geom_line(aes(x = Wavelength, y = Stepup.abs, color = "Step Up")) +
  geom_line(aes(x = Wavelength, y = Triangle.abs, color = "Triangle")) +
  geom_line(aes(x = Wavelength, y = Highline.abs, color = "High Flat Line")) +
  geom_line(aes(x = Wavelength, y = Lowline.abs, color = "Low Flat Line")) +
  xlab('Wavelength (nm)') +
  ylab('Absorption') +
  ggtitle("Absorption for Different Custom n Functions") +
  guides(color=guide_legend("Material")) +
  theme(legend.position = c(0.8, 0.8))


# To make the peaks more clear for all of the n functions, the base 10 
# log of the absorption was taken for all of the functions and then graphed the same way
# with 4 added to the log values to put them above zero

n.logresults.graph <- ggplot(data = n.results) + 
  geom_area(aes(x = Wavelength, y = log10(Stepdown.abs)+4, color = "Step Down"), alpha = 0.05) +
  geom_area(aes(x = Wavelength, y = log10(Stepup.abs)+4, color = "Step Up"), alpha = 0.05) +
  geom_area(aes(x = Wavelength, y = log10(Triangle.abs)+4, color = "Triangle"), alpha = 0.05) +
  geom_area(aes(x = Wavelength, y = log10(Highline.abs)+4, color = "High Flat Line"), alpha = 0.05) +
  geom_area(aes(x = Wavelength, y = log10(Lowline.abs)+4, color = "Low Flat Line"), alpha = 0.05) +
  xlab('Wavelength (nm)') +
  ylab('Log of Absorption') +
  ggtitle("Absorption for Different Custom n Functions") +
  guides(color=guide_legend("Material")) +
  theme(legend.position = c(0.7, 0.7))

# Create a function that displays a graph for the absorption with respect to wavelength
# for a given material inparticular. Here, g is the variable defining the 
# wanted material

n.startfunction.graph <- function(g){
  ggplot(data = n.results) +
    geom_area(aes(x = Wavelength, y = g), alpha = 0.3, colour = "black") +
      xlab('Wavelength (nm)') +
      ylab('Absorption') +
      ggtitle("Absorption of Custom n Material")
}

# Simplify function so the input is simply the name of the column

n.function.graph <- function(z){
  n.startfunction.graph(n.results[,z])
}

# Display results

n.results.graph
n.logresults.graph
n.function.graph("Stepdown.abs")

