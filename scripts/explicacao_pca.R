
library(rafalib)
mypar(1,1)

x = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y = c(0.1, 4, 1, 5, 2, 8, 3, 7, 4, 11)

# Gráfico 1 (Figura 4)

plot(x, y, xlim=c(0,11), ylim=c(-3,12), asp=1, main="Projeção dos dados sobre a primeira componente principal")

# CP1
model = lm(y ~ x)
abline(model)
text(15, 10.5, "CP1")
cp1.intercept <- model$coefficients["(Intercept)"]
cp1.slope <- model$coefficients["x"] 
perp.slope <- -1/cp1.slope 

# projeções sobre CP1
perp.intercept <- -perp.slope*x + y
x1 <- (perp.intercept - cp1.intercept) / (cp1.slope - perp.slope)
y1 <- cp1.intercept + cp1.slope*x1
segments(x, y, x1, y1, lty=3)
points(x1, y1, pch=3)




# Gráfico 2 (Figura 5)

plot(x, y, xlim=c(0,11), ylim=c(-3,12), asp=1, main="Projeção dos dados sobre outra reta r2 qualquer")

# linha de baixa variância r2
r2.intercept <- cp1.intercept - 3
r2.slope <- perp.slope - 0.2
abline(r2.intercept, r2.slope)
text(-5, 6, "r2")
perp.slope <- -1/r2.slope 

# projeções sobre r2
perp.intercept <- -perp.slope*x + y
x1 <- (perp.intercept - r2.intercept) / (r2.slope - perp.slope)
y1 <- r2.intercept + r2.slope*x1
segments(x, y, x1, y1, lty=3)
points(x1, y1, pch=3)

