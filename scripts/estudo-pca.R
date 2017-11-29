# Leonardo 2016

csv_file <- 'dados/votes-cmsp-2015.csv'
data  <- read.csv(csv_file, sep=',', as.is=T)
votes_matrix <- with(data, tapply(vote, list(voter_id, rollcall), c))
votes_matrix[is.na(votes_matrix)] <- 0 # Transforma NAs em 0s
dim(votes_matrix)
# votes_matrix: 67 vereadores X 131 votações

# Esse
s <- svd( votes_matrix - mean(votes_matrix) )
plot(s$d[1]*s$v[,1], s$d[2]*s$v[,2])
# equivale a esse
pca <- prcomp( t(votes_matrix) )
plot(pca$x[,1], pca$x[,2])
# Mas temos 131 pontos, o que corresponde às votações, e não aos vereadores.
names(pca)

# prcomp assumes: units/samples in row and features in columns.

# Esse
s <- svd( t(votes_matrix) - mean(t(votes_matrix)) )
plot(s$d[1]*s$v[,1], s$d[2]*s$v[,2])
# deveria corresponder a esse
pca <- prcomp( votes_matrix )
plot(pca$x[,1], pca$x[,2])
# mas são diferentes

x1 <- s$d[1]*s$v[,1]
x2 <- pca$x[,1]
length(x1)
length(x2)
x1[1:10]
x2[1:10]

###########################################
  
# Tentando resolver o problema
# Referência: http://genomicsclass.github.io/book/pages/pca_svd.html
# First, the typical principal component analysis on the samples would be 
# such that the samples are rows of the data matrix.
# Em nosso caso, os parlamentares são as amostras.
# This PCA is equivalent to performing the SVD on the centered data, 
# where the centering occurs on the columns (votações)
# So the columns of U from the SVD correspond to the principal components. 

# pca típico: samples are rows (samples = parlamentares) 
pca <- prcomp(votes_matrix)
plot(pca$x[,1], pca$x[,2])
length(pca$x[,1]) # 67

cx <- sweep(votes_matrix, 2, colMeans(votes_matrix), "-") # centering
sv <- svd(cx)
plot(sv$u[, 1], sv$u[, 2], main = "SVD", xlab = "U1", ylab = "U2")
length(sv$u[, 1]) # 67
# Obs: esse trecho é como fazemos no Radar:
# centralizamos por coluna e usamos a matriz U

# Tentando agora transpor a matriz
# pra analisarmos as proximidades entre as votações.

pca <- prcomp(t(votes_matrix))
plot(pca$x[,1], pca$x[,2])
length(pca$x[,1]) # 131

tx <- t(votes_matrix)
cx <- sweep(tx, 2, colMeans(tx), "-") # centering
sv <- svd(cx)
plot(sv$u[, 1], sv$u[, 2], main = "SVD", xlab = "U1", ylab = "U2")
length(sv$u[, 1]) # 131

################################################

# Dúvida: utilizamos agora a pouco as colunas de U pra obter 
# as coordenadas PCAs dos vereadores.
# Mas ao longo do texto (do livro de data anlysis for life sciences)
# o utilizado era a multiplicação de D pelas colunas de V.
# Será que são exatamente a mesma coisa? Vamos ver...

cx <- sweep(votes_matrix, 2, colMeans(votes_matrix), "-") # centering
sv <- svd(cx)
plot(sv$u[, 1], sv$u[, 2], main = "SVD", xlab = "U1", ylab = "U2")
length(sv$u[, 1]) # 67

tx <- t(votes_matrix)
tx <- sweep(tx, 2, colMeans(tx), "-") # centering
svt <- svd(tx)
pca1 <- svt$d[1]*svt$v[,1]
pca2 <- svt$d[2]*svt$v[,2]
plot(pca1, pca2)
length(pcax) # 67

# São diferentes!
# Qual deveria ser o input de svd para conseguir 
# d[1]*v[,1] igual ao u[,1] que obtivemos na outra situação (input cx)?

# outra tentativa

tx <- t(votes_matrix)
svt <- svd(tx - mean(tx))
pca1 <- svt$d[1]*svt$v[,1]
pca2 <- svt$d[2]*svt$v[,2]
plot(pca1, pca2)
length(pcax) # 67

# também dá diferente


