source("radar.R")

minvotes=0
lop=-1
# obs: wnominate usa por padrão minvotes=20 e lop=0.025

analisar <- function(analise, title) {
  roll_call <- build_rollcall(paste('dados/', analise, '.csv', sep=''), title)
  radar_pca <- radarpca(roll_call, lop = lop, minvotes = minvotes)
  plot_radar(radar_pca)
}

#analisar('sen2005-2006')
#analisar('cmsp2015')

analisar('cdep2007-2010', 'Câmara dos Deputados 2007 - 2010') 
analisar('cdep2011-2014', 'Câmara dos Deputados 2011 - 2014') 
analisar('sen2007-2010', 'Senado 2007 - 2010')
analisar('sen2011-2014', 'Senado 2011 - 2014') 
analisar('cmsp2013-2016', 'Câmara Municipal de São Paulo 2013 - 2016') 

