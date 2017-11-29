source("radar.R")
library(rafalib)

mypar(1,1)
cores <- c("#000000", "#FF0000", "#FF5B00", "#0059AB", "#80c341", "#002664", "#002664", "#203487", "#110274", "#ff0066", "#6c85b1", "#1f1a17", "#f95800", "#25b84a", "#f7931e", "#da251c", "#ffff66", "#990099", "#00CC00", "#D51500", "#00ffff", "#990099", "#cc00cc", "#ffff66", "#999966", "#FFFF00", "#312dc1", "#ffff6b", "#0066ff", "#004607", "#cc00cc", "#1db10c")
partidos <- c("Sem partido", "PT", "PMDB", "PSDB", "PSD", "DEM", "PFL", "PP", "PR", "PSB", "PDT", "PTB", "SD", "PSC", "PROS", "PCdoB", "PPS", "PRB", "PV", "PMN", "PEN", "PTdoB", "PHS", "PRP", "PSL", "PSOL", "PRTB", "PSDC", "PTC", "PPL", "PAN", "REDE")
shapes <- c(19, 19, 19,   19,   19,  19,  19,  15, 17, 18,  15,  15,  15, 15,  17,  15,    17,  19,  17, 17,  18,  17, 15,  18,  18,  19,   18,   15,   17,  17,  18,  18) 
length(partidos) # 32
x <- c(rep(1, 8), rep(2, 8), rep(3, 8), rep(4, 8))
y <- c(seq(8, 1), seq(8,1), seq(8,1), seq(8,1))
plot(x, y, xlab="", ylab="", xaxt="n", yaxt="n", bty="n", main="Partidos", 
     col=cores, pch = shapes, xlim=c(1,4.5))
text(x, y, labels=partidos, pos=4, cex=0.8)
