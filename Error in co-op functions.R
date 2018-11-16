# Import csv files for refractive indices of all five materials
# and their errors
setwd("/Users/zacharyrex/Desktop/Project Portfolio/Co-op Data")
Silicon <- read.csv("Si.csv")
GaN <- read.csv("GaN.csv")
GaAs <- read.csv("GaAs.csv")
CdTe <- read.csv("CdTe.csv")
Perovskite <- read.csv("Perovskite")


# Rename column displaying the error for the n values in each dataframe

colnames(Silicon)[6] <- "Error.n"
colnames(GaN)[6] <- "Error.n"
colnames(GaAs)[6] <- "Error.n"
colnames(CdTe)[6] <- "Error.n"
colnames(Perovskite)[6] <- "Calc.n"
colnames(Perovskite)[7] <- "Error.n"

# Calculate the average error for each refractive index of each material
# and find a total average error from all of the materials

# n errors

n.error.Si <- mean(Silicon[["Error.n"]])
n.error.GaN <- mean(GaN[["Error.n"]])
n.error.GaAs <- mean(GaAs[["Error.n"]])
n.error.CdTe <- mean(CdTe[["Error.n"]])
n.error.Perovskite <- mean(Perovskite[["Error.n"]])

average.n.error <- mean(n.error.Si,n.error.CdTe,n.error.GaAs,n.error.GaN,
                        n.error.Perovskite)

average.n.error

# k errors

k.error.Si <- mean(Silicon[["Error.k"]])
k.error.GaN <- mean(GaN[["Error.k"]])
k.error.GaAs <- mean(GaAs[["Error.k"]])
k.error.CdTe <- mean(CdTe[["Error.k"]])
k.error.Perovskite <- mean(Perovskite[["Error.k"]])

average.k.error <- mean(k.error.CdTe, k.error.GaAs, k.error.GaN, k.error.Perovskite,
                        k.error.Si)

average.k.error

# Created functions that display the error for both the n function and the k function
# with respect to wavelength for any of the materials. The parameters are the element
# and the y-axis limit which is defaulted at 20% error for n and 1000% error for k

error.function.n <- function(elementdata, y = 20){
  ggplot(data = elementdata, aes(x = Wavelength..nm., y = Error.n)) +
    geom_line() + xlim(200,1000) + ylim(0,y) + xlab("Wavelength (nm)") + 
    ylab("Percent Error") + ggtitle("Error in n")
}

error.function.k <- function(elementdata, y = 2000){
  ggplot(data = elementdata, aes(x = Wavelength..nm., y = Error.k)) +
    geom_line() + xlim(200,1000) + ylim(0,y) + xlab("Wavelength (nm)") + 
    ylab("Percent Error") + ggtitle("Error in k")
}

# Run results and functions

average.n.error
average.k.error
error.function.n(Perovskite,105)
error.function.k(Silicon)

n.error.CdTe
n.error.GaAs
n.error.GaN
n.error.Perovskite
n.error.Si

