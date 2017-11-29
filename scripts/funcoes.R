
# Figura 2

library(rafalib)
mypar(1,1)
x <- seq(-4, 4, length=100)
p <- dnorm(x)*10
plot(x, p, type="l", xlab="x", ylab="U",
     main="Função utilidade simétrica e de pico único")

# Figura 3

library(rafalib)
mypar(1,2)
x <- seq(-4, 4, length=100)
p <- dnorm(x)*10
plot(x, p, type="l", xlab="x", ylab="U",
     main="Função gaussiana")
x <- seq(-4, 4, length=100)
p <- (-x^2 + 15)/3.5
plot(x, p, type="l", xlab="x", ylab="U",
     main="Função quadrática")

