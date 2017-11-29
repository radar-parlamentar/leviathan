
perfil_opcoes <- function(analise) {
  csv_file <- paste('dados/', analise, '.csv', sep='')
  data  <- read.csv(csv_file, sep=',', as.is=T)
  
  cat(paste(analise, '\n'))
  
  abstencoes_ou_obstrucoes <- sum(data$vote == 0) / length(data$vote)
  cat('abstencoes ou obstrucoes =', round(abstencoes_ou_obstrucoes*100, 2), '%\n')
  
  cdep_size <- 513
  qtd_votacoes <- length(unique(data$rollcall))
  cat(qtd_votacoes, 'votações\n')
  faltas <- 1 - length(data$vote) / (cdep_size * qtd_votacoes)
  cat('faltas =', round(faltas*100, 2), '%\n')
}

perfil_opcoes('cdep2007-2010')
perfil_opcoes('cdep2011-2014')
perfil_opcoes('cmsp2013-2016')

