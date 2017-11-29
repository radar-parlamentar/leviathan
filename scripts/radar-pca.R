# Leonardo 2016
# Um código mais minimalista para se gerar o gráfico PCA
# com o objetivo de compará-lo ao gráfico gerado no Radar Parlamentar.

library(rafalib)
mypar(1,1)

csv_file <- 'dados/votes-cmsp-2015.csv'
data  <- read.csv(csv_file, sep=',', as.is=T)
votes_matrix <- with(data, tapply(vote, list(voter_id, rollcall), c))
votes_matrix[is.na(votes_matrix)] <- 0 # Transforma NAs em 0s
pca <- prcomp(votes_matrix)

x <- pca$x[,1]
y <- pca$x[,2]

paleta <- c("#15c5ff", "#203487", "#203487", "#203487", "#203487", "#6c85b1", "#FF0000", "#1f1a17", "#FF5B00", "#c30909", "#173495", "#cd0600", "#f2ed31", "#25b84a", "#800205", "#110274", "#110274", "#fea801", "#002664", "#002664", "#ffff6b", "#312dc1", "#610100", "#65a4fb", "#D51500 ", "#0066ff", "#0066ff", "#ff8d00", "#00CC00", "#67a91e", "#0059AB", "#FFFF00", "#004607", "#80c341", "#da251c", "#2ba138", "#226d2a", "#312dc1", "#114d12", "#173495", "#d7bf1f", "#094196", "#15c5ff", "#f7931e", "#f95800", "#562a72", "#a1a838", "#1db10c")
names(paleta) <- as.factor(c("PRB", "PDS", "PPR", "PP", "PPB", "PDT", "PT", "PTB", "PMDB", "PSTU", "PSL", "PST", "PTN", "PSC", "PCB", "PR", "PL", "PPS", "DEM", "PFL", "PSDC", "PRTB", "PCO", "PHS", "PMN", "PRN", "PTC", "PSB", "PV", "PRP", "PSDB", "PSOL", "PPL", "PSD", "PCdoB", "PTdoB", "PRONA", "PTR", "PRS", "PDC", "PEN", "PAN", "PMR", "PROS", "SD", "ARENA", "MDB", "REDE"))

partidos <- as.matrix(with(data, tapply(party, voter_id, unique))) 
num.partidos <- length(levels(as.factor(partidos)))
cores <- paleta[partidos]

symbols(x, y, circles=rep(1,length(x)), inches=0.03, fg=cores, bg=cores)
partidos.ordenados.por.bancada <- names(sort(table(partidos), decreasing=TRUE))
legend("topright", partidos.ordenados.por.bancada, col=paleta[partidos.ordenados.por.bancada], pch=19) 


# TODO imprimir a legenda completa 
