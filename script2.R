## Vecteurs atomiques ----
seq_len(5)

# Exercice 1.1 ----
v <- seq(from = 10,to = 20,by =2)
v[1:3]
v[v[1:length(v)]<15]

derniere <- function(v){
  v[length(v)]
}
derniere(v)

sauf_derniere <- function(v){
  v[-length(v)]
}
sauf_derniere(v)

# Exercice 1

library(questionr)
data(hdv2003)
df <- hdv2003
dim(df)
names(df)


