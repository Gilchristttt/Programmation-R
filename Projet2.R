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
  geom_boxplot(aes(x=X, y=Y))


## 3--------
par(mfrow = c(1, 2))
plot(df$X, df$Y)
curve(sin(x)+log(x), from=0.01, to=10)

