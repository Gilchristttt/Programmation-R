# 2  Les k plus proches voisins en régression ----

## 1 ----
realisation <- function(n){
  eps = rnorm(n,mean = 0, sd=1)
  X <- runif(n,0,10)
  Y <- sin(X) + log(X) + eps
  data.frame(X,Y)
}
n= 10
realisation(n)

## 2 ----
library(tidyverse)
df <- realisation(100)

plot(df$X, df$Y)

ggplot(df) +
  geom_point(aes(x= X, y = Y, colour = X))

ggplot(df) +
  geom_boxplot(aes(x=X, y=Y))+
  


## 3--------
par(mfrow = c(1, 2))
plot(df$X, df$Y)
curve(sin(x)+log(x), from=0.01, to=10)


# 4 -------

##a ----

methode_kpp <- function(k,x){
  eps = rnorm(n,mean = 0, sd=1)
  X <- runif(n,0,10)
  
  d_x_i <- abs(x-X)
  d_x_k <- abs(x-X[k])
  N_k_x = which(d_x_i <= d_x_k)
  
  Y <- sin(x) + log(x) + eps
  Y <- Y[N_k_x]
  f <- (1/k)* sum(Y)
  f
}
##b & c----
X <- seq(from=0.1, to=9.9, by=0.1)
Y <- sapply(X, methode_kpp,k= 10)
dataf <- data.frame(Valeur=X, Prédiction=Y)

library(knitr)
kable(dataf)

plot(X,Y, type = "l")

ggplot(dataf) +
  geom_point(aes(x=X, y=Y))

ggplot(dataf) +
  geom_line(aes(x=X, y=Y))+
  geom_point(data = df, aes(x= X, y = Y, colour = X))

