library(tidyverse)
library(questionr)
data(hdv2003)

recode_oui_non <- function(df){
  df <- fct_recode(df, 
          "o"="Oui",
          "n"="Non"
  )
  return(df)
}

recode_oui_non(hdv2003$hard.rock)
recode_oui_non(hdv2003$lecture.bd)
recode_oui_non(hdv2003$cuisine)

df <- data.frame(
  fruit = c("Pomme", "Pomme", "Citron", "Citron"),
  poids = c(147, 189, 76, 91)
)
filtre_pommes <- function(d) {
  d <- dplyr::filter(d, fruit == "Pomme")
  d
}
filtre_pommes(df)


etendue <- function(v){
  min <- min(v)
  max <- max(v)
  return(max-min)
}
tapply(hdv2003$age,hdv2003$qualif,etendue)

vn <- c(val1 = 10, val2 = 0, val3 = 14)

select_noms <- function(v,noms){
  v[noms]
}
select_noms(vn, c("val2", "val3"))
        
sauf_nom <- function(v,noms){
  v[names(v)!=noms]
}  
sauf_nom(vn,"val2")


x <- c(1, NA, 3, 4, NA)
y <- c(10, 20, 30, 40, 50)

x[is.na(x)]
y[is.na(x)]
x[is.na(x)] <- y[is.na(x)]
x

problemes_conversion <- function(v){
  v<- v[!is.na(v)] # v sans NA de depart
  new_v <-as.numeric(v)
  v[is.na(new_v)]
}
x <- c("igloo", "20", NA, "3.5", "4,8")
problemes_conversion(x)

liste <- list(1:3, runif(5), "youpi")
liste[[1]][c(1,3)]
liste[1]
liste[[1]]
liste[[1]][2]


description_liste <- function(lst){
  list(premier_element = lst[[1]],
       dernier_element = lst[[length(lst)]],
       nb_element = length(lst))
}

liste <- list(1:3, runif(5), "youpi")
description_liste(liste)

df <- tribble(
  ~fruit, ~poids, ~couleur,
  "Pomme", 154, "vert",
  "Pomme", 167, "vert",
  "Citron", 92, "jaune"
)
df$fruit
df[[1]]

df[[1]]<- str_to_upper(df[[1]])
df


colonne_maj <- function(d,colonne){
  noms_vect <- names(d)
  position <- which(noms_vect==colonne)
  df[[position]] <- str_to_upper(df[[position]]) 
  df
}
colonne_maj(df, "couleur")

colonne_maj1 <- function(df, colonne) {
  df[[colonne]] <- toupper(df[[colonne]])  # toupper est plus simple pour une majuscule
  return(df)
}
colonne_maj1(df, "couleur")
