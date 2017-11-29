
library("wnominate")

analisar <- function(analise) {
  
  csv_file <- paste('dados/', analise, '.csv', sep='')
  data  <- read.csv(csv_file, sep=',', as.is=T)
  
  #l <- list(data$voter_id, data$rollcall)
  #length(l) # 2
  #head(l[1]) # voters
  #head(l[2]) # rollcalls
  
  votes_matrix <- tapply(data$vote, list(data$voter_id, data$rollcall), c)
  # Pra cada par (voter_id, rollcall) gera um vetor com os votos do voter no rollcall
  # Mas o esperado é que cada voter tenha apenas um voto (ou nenhum) no rollcall
  
  votes_matrix[is.na(votes_matrix)] <- 0 # Transforma NAs em 0s
  dim(votes_matrix) # rows = votes and columns = rollcalls
  
  ?rollcall
  rc_object <- rollcall(votes_matrix, yea=1, nay=-1, missing=0)
  rc_object
  summary(rc_object)
  
  ?wnominate
  # que chato ter que falar esse polarity
  # valores default: minvotes = 20, lop = 0.025
  wn <- wnominate(rc_object, polarity=c(1,1))
  # para variar lop e minvotes:
  # wn <- wnominate(rc_object, polarity=c(1,1), lop=0, minvotes=0)
  
  plot(wn)
  # wnominate gera pontos e linhas.
  # Pontos são parlamentares.
  # Linhas são votações. Um lado da linha é SIM e o outro é NÃO.
  # WNominate tenta maximizar a quantidade de pontos do lado certo da linha.
  
  s <- summary(wn)
  # Predicted Yeas: vê quantos pontos caíram corretamente do lado Yes da linha
  # Predicted Nays: vê quantos pontos caíram corretamente do lado Nay da linha
  # Correct Classifiction
  # APRE
  # GMP

  paste('Número de dimensões estimadas:', wn$dimensions)
  egvs <- wn$eigenvalues
  egvs <- egvs[which(egvs > 0)]
  variance <- trunc(egvs[1:5] / sum(egvs) * 100)
  cat("\nVariancia Explicada 1D:  ", variance[1], "%")
  cat("\nVariancia Explicada 2D:  ", variance[2], "%")
  cat("\nVariancia Explicada 3D:  ", variance[3], "%")
  cat("\nVariancia Explicada 4D:  ", variance[4], "%")
  cat("\nVariancia Explicada 5D:  ", variance[5], "%")
  cat('\nVariâncias explicadas 1D + 2D: ', sum(variance[1:2]), '%')
}

analisar('cdep2007-2010') 
analisar('cdep2011-2014') 
analisar('sen2007-2010')
analisar('sen2011-2014') 
analisar('cmsp2013-2016') 


