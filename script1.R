## Ecrire ma fonction ---------
## Fonction 
multiplication <- function(x,y){
  resultat <- x*y
  return(resultat)
}
multiplication(2,3)

multiplication(1:5,5)


prop_tab <- function(v,decimales,useNA) {
  tri <- table(v,useNA = useNA)
  effectif_total <- length(v)
  tri <- tri / effectif_total * 100
  tri <- round(tri,decimales)
  return(tri)
}
vec <- c("rouge", "vert", "vert", "bleu", "rouge")
prop_tab(vec)
table(vec)

library(questionr)
data(hdv2003)
prop_tab(hdv2003$qualif,1,"no")


my_barplot <- function(var){
  tri <- table(var)
  barplot(tri,col="skyblue")
}
my_barplot(hdv2003$clso)


indicateurs <- function(v){
  print(mean(v))
  print(sd(v))
  print(range(v))
}
indicateurs(hdv2003$age)
       

salut <- function(nom){
  cat("Salut", nom, "!")
}
salut("Gilchrist")


library(forcats)
q1 <- c("1","1","0")
q1 <- fct_recode(q1,
                    "Oui" = "1",
                    "Non" = "0"
)
q1

## Arguments et résultat d’une fonction ----

sans_return <- function(x){
  x**2
}
sans_return(2)

f <- function(x) {
  x + 2
}
g <- f
g(2)

formals(f)
body(f)

df <- data.frame(
  fruit = c("Pomme", "Pomme", "Citron", "Citron"),
  poids = c(147, 189, 76, 91)
)
df

tapply(df$poids,df$fruit,range)

## Exercices -------

#Exercice 1.1

perimetre <- function(r){
  p <- 2*pi*r
  return(p)
}
perimetre(4)

# Exercice 1.2

etendue <- function(v){
  min <- min(v)
  max <- max(v)
  return(max-min)
}
etendue(c(18, 35, 21, 40))

# Exercice 1.3

alea <- function(n,min,max){
  vect <- trunc(runif(n,min,max))
  return(vect)
}
v <-alea(10000,1,6)
table(v)

# Exercice 1.4

meteo <- function(ville){
  out <- readLines(paste0("https://v2.wttr.in/", ville, "?A"))
  cat(out,sep="\n")
}
meteo("Paris")

# Exercice 1.5

library(questionr)
library(tidyverse)
data(hdv2003)
hdv2003$hard.rock <- str_to_lower(hdv2003$hard.rock)
hdv2003$hard.rock <- fct_recode(hdv2003$hard.rock, "o" = "oui", "n" = "non")


recode_oui_non <- function(){
  
}

# Exercice 2.1

moyenne_arrondie <- function(vect, rmNA = FALSE ,decimal= 2) {
  round(mean(vect, na.rm = rmNA),decimal)
}
v <- c(1,2,7,NA)
moyenne_arrondie(v,TRUE,1)

# Exercice 2.2

centrer_reduire <- function(x) {
  x - mean(x) / sd(x)
}
centrer_reduire(1:5)

# Exercice 2.3

caracteristiques_mot <- function(mot){
  initiale <- str_sub(mot,1,1)
  len <- nchar(mot)
  list(initiale= initiale,longueur=len)
}
caracteristiques_mot("Bidonnage")


# Exercice 3.2

df <- data.frame(
  fruit = c("Pomme", "Pomme", "Citron", "Citron"),
  poids = c(147, 189, 76, 91)
)
filtre_pommes <- function(d,filtre) {
  d <- dplyr::filter(d, fruit == "Pomme")
  return(d)
}
filtre_pommes(df)
df

# Exercice 4.1

bonjour <- function(){
  print("Bonjour !")
}

salut <- bonjour

# Exercice 4.2
etendue <- function(v){
  min <- min(v)
  max <- max(v)
  return(max-min)
}
tapply(hdv2003$age,hdv2003$qualif,etendue)


# Exercice 4.3

f <- function(y) {
  y * 4
}
body(f)
f(5)
body(f) <- quote(y + 2) # change la fonction
body(f)
f(5)

