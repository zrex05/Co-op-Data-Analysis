# Gather all of the trials for the k value dropoff functions and put into dataframe
getwd()
setwd("/Users/zacharyrex/Desktop/Project Portfolio/Co-op Data")

k.results.silver <- read.csv("k function results silver.csv")
colnames(k.results.silver) <- c("Wavelength","0.7","0.75","0.8","0.85","0.9","1.1","1.3",
                         "1.5", "1.6","1.7","1.8","2.0")

k.results.layer <- read.csv("k function results layer.csv")
colnames(k.results.layer) <- c("Wavelength","0.7","0.75","0.8","0.85","0.9","1.1","1.3",
                                "1.5", "1.6","1.7","1.8","2.0")

# Create graph displaying the peak absorption value with respect to where the drop-off
# in the k value occured (in eV)

eV.values <- c(.7, .75, .8, .85, .9, 1.1, 1.3, 1.5, 1.6, 1.7, 1.8, 2.0)
peak.absorption.values.k <- c(max(k.results.silver[,"0.7"]),
                              max(k.results.silver[,"0.75"]),
                              max(k.results.silver[,"0.8"]),
                              max(k.results.silver[,"0.85"]),
                              max(k.results.silver[,"0.9"]),
                              max(k.results.silver[,"1.1"]),
                              max(k.results.silver[,"1.3"]),
                              max(k.results.silver[,"1.5"]),
                              max(k.results.silver[,"1.6"]),
                              max(k.results.silver[,"1.7"]),
                              max(k.results.silver[,"1.8"]),
                              max(k.results.silver[,"2.0"]))
 
matplot(x = eV.values, y = log(peak.absorption.values.k),
        ylab = "Log of Peak Absorption", type="b", pch=15:18, col=c(1:4,6), 
        main = "Log of Peak Absorption vs Energy at k Drop",
        xlab = "Energy at k Drop (eV)")

# Create graph displaying average fraction of silver absorption to layer absorption 
# (approximately total absorption)

fraction.of.total.absorption <- c(sum(abs(k.results.silver[,"0.7"]))/sum(abs(k.results.layer[,"0.7"])),
                                  sum(abs(k.results.silver[,"0.75"]))/sum(abs(k.results.layer[,"0.75"])),
                                  sum(abs(k.results.silver[,"0.8"]))/sum(abs(k.results.layer[,"0.8"])),
                                  sum(abs(k.results.silver[,"0.85"]))/sum(abs(k.results.layer[,"0.85"])),
                                  sum(abs(k.results.silver[,"0.9"]))/sum(abs(k.results.layer[,"0.9"])),
                                  sum(abs(k.results.silver[,"1.1"]))/sum(abs(k.results.layer[,"1.1"])),
                                  sum(abs(k.results.silver[,"1.3"]))/sum(abs(k.results.layer[,"1.3"])),
                                  sum(abs(k.results.silver[,"1.5"]))/sum(abs(k.results.layer[,"1.5"])),
                                  sum(abs(k.results.silver[,"1.6"]))/sum(abs(k.results.layer[,"1.6"])),
                                  sum(abs(k.results.silver[,"1.7"]))/sum(abs(k.results.layer[,"1.7"])),
                                  sum(abs(k.results.silver[,"1.8"]))/sum(abs(k.results.layer[,"1.8"])),
                                  sum(abs(k.results.silver[,"2.0"]))/sum(abs(k.results.layer[,"2.0"])))

matplot(x = eV.values, y = fraction.of.total.absorption,
        ylab = "Fraction of Total Absorption", type="b", pch=15:18, col=c(1:4,6), 
        main = "Fraction of Total Absorption for Silver vs Energy at k Drop",
        xlab = "Energy at k Drop (eV)")                            

# Lastly, create a graph showing the wavelengths at which the peak absorption occurs for each of the trials

peak.absorption.values.k
k.results.silver
peak.wavelength.postions.k <- c(1655.290, 1655.290, 1530.000, 1422.330, 1328.820, 1246.850, 1109.920,
                                834.854, 834.854, 742.811, 952.933, 608.612)
matplot(x = eV.values, y = peak.wavelength.postions.k,
        ylab = "Wavelength (nm)", type="b", pch=15:18, col=c(1:4,6), 
        main = "Wavelength Position at Peak Absorption for Different Energy Levels",
        xlab = "Energy at k Drop (eV)")   
