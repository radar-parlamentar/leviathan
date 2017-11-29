
# Referência: http://genomicsclass.github.io/book/pages/pca_svd.html

#library(devtools)
#install_github('dagdata','genomicsclass')
library(dagdata)
library(tissuesGeneExpression)
data(tissuesGeneExpression)
library(rafalib)
group <- as.fumeric(tab$Tissue)

dim(e)
# e: 22215 genes X 189 samples

# the typical principal component analysis on the samples would
# such that the samples are rows of the data matrix
x <- t(e) # rows: samples
pc <- prcomp(x)
plot(pc$x[, 1], pc$x[, 2], col = group, main = "PCA", xlab = "PC1", ylab = "PC2")
length(x[, 1])
# gráfico tem 189 pontos
# Então pontos correspondem a amostras, e amostras ficam nas linhas.
# Ou seja, "amostra" é quem você quer ver no gráfico.
# Então no nosso caso, amostras seriam os parlamentares.

# This [typical] PCA is equivalent to performing the SVD on the centered data, 
# where the centering occurs on the columns
cx <- sweep(x, 2, colMeans(x), "-")
sv <- svd(cx)
plot(sv$u[, 1], sv$u[, 2], col = group, main = "SVD", xlab = "U1", ylab = "U2")
# Note que aqui usamos a matriz U!!!
# Note também que em cx as amostras estão nas linhas também.


# SVD on the data matrix where samples are columns, with no centering,...
sv1 <- svd(e)
plot(sv1$v[, 1], sv1$v[, 2], col = group, main = "genes vs samples (SVA)", xlab = "V1", 
     ylab = "V2")
length(sv1$v[, 1]) # 189 pontos. Usamos apenas sv$v!!!

# ... is equivalent to the SVD on the data matrix where the samples are rows
sv2 <- svd(t(e))
plot(sv2$u[, 1], sv2$u[, 2], col = group, main = "samples vs genes (typical PCA)", 
     xlab = "U1", ylab = "U2")

# Ou seja, se amostras estão nas linhas use sv$u
# Se amostras estão nas colunas, use sv$v

# Dúvida: se nesta seção usamos apenas sv$u ou sv$v,
# então por que em outros lugares do livro o PCA era dado por
# plot(sv$d[1]*sv$v[,1], sv$d[2]*sv$v[,2]) ?










