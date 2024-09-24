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

df[3,1]
filtre_valeur()

df[1,c(1,3)]
df[df$poids<100,1]

filtre_valeur <- function(valeur){
  df[df$fruit== valeur,]
}
filtre_valeur("Pomme")

filtre_valeur <- function(d,valeur){
  d <- d[d$fruit== valeur,]
  d
}
filtre_valeur(df, "Citron")

filtre_valeur <- function(d, colonne, valeur){
  d <- d[d[colonne]== valeur,]
  d
}
filtre_valeur(df, colonne = "couleur", valeur = "jaune")

filtre_valeur(hdv2003, "sexe", "Femme")

df["id"] <- c(1,2,3)
df[3,3] <- "jaune citron"
df["poids_rec"] 

fonc_poids <- function(df){
  vec_poid = c()
  for (p in df["poids"]){
    if (p <= 100){
      vec_poid = c(vec_poid,"léger")
    } else {
      vec_poid = c(vec_poid,"lourd")
    }
  }
  vec_poid
}
fonc_poids(df)

df$poids_rec <- ifelse(df$poids < 100, "léger", "lourd")

df <- df %>% 
  mutate(poids_rec=ifelse(poids < 100, "léger", "lourd"))


avertissement <- function(pluie, parapluie){
  if ((pluie) & (parapluie)){
    message("bien vu")
  } 
  else if ((pluie) & (!parapluie)){
    message("mouillé")
  } 
  else if (!pluie){
    message("RAS")
  }
}
avertissement(TRUE,TRUE)

etendue <- function(v){
  if(!is.numeric(v)){
    warning("val non numeric") 
    return(NA)
  } else{
  min <- min(v)
  max <- max(v)
  return(max-min)
  }
}
v <- c(1,4,6)
y <- c("a","b","c")
etendue(y)

moyenne_ar <- function(x,d=1){
  round(mean(x),d)
}
moyenne_ar(c(2,4,4))

proportion <- function(v){
  if (sum(v)==0){
    message("Division par 0")
  }else {
  for (e in v){
    print(e/sum(v))
  }
  }
}
proportion(c(-2, 1, 1))

proportion <- function(vecteur) {
  # Calculer la somme des éléments du vecteur
  somme <- sum(vecteur)
  
  # Vérifier si la somme est égale à 0
  if (somme == 0) {
    stop("Erreur : La somme des éléments du vecteur est 0.")
  }
  
  # Calculer les proportions
  proportions <- vecteur / somme
  return(proportions)
}

for (name in names(hdv2003)){
  if(is.numeric(hdv2003[[name]])){
    hist(hdv2003[[name]],main =paste("Histogramme de",name))
  }
}

somme_positifs <- function(x){
  tmp = 0
  for (elem in x){
    if (elem >=0){
      tmp = tmp +elem
    }
  }
  tmp
}
v <- c(1,4,6,-3,-8)
somme_positifs(v)
sum(v[v>=0])

somme_premiers_positifs <- function(x){
  tmp = 0
  for (elem in x){
    if (elem < 0){
      message("Premier element négatif est ", elem)
      s = paste("la somme est égale à ", tmp)
      return(s)
    }
    tmp = tmp+elem
  }
  tmp
}
w <- c(1,2,3,-3)
somme_premiers_positifs(w)


somme_premiers_positifs <- function(vecteur) {
  somme <- 0  # Initialisation de la somme
  
  # Parcourir le vecteur avec une boucle for
  for (valeur in vecteur) {
    if (valeur < 0) {
      break  # On s'arrête au premier élément négatif
    }
    somme <- somme + valeur  # Ajouter les valeurs positives
  }
  
  return(somme)
}

somme_premiers_positifs <- function(vecteur) {
  # Trouver l'index du premier élément négatif
  index_negatif <- which(vecteur < 0)[1]
  
  # Si aucun élément négatif, prendre tout le vecteur, sinon prendre jusqu'à l'élément négatif
  if (is.na(index_negatif)) {
    vecteur_positifs <- vecteur  # Si pas de négatif, tout le vecteur
  } else {
    vecteur_positifs <- vecteur[1:(index_negatif - 1)]  # Jusqu'au premier élément négatif
  }
  
  # Calculer la somme des éléments positifs
  somme <- sum(vecteur_positifs)
  return(somme)
}

pile_ou_face <- function(n) {
  alea <- runif(1)
  result <- c()
  for (i in range(n)){
  if (alea < 0.5) {
    result <- c(result,"pile")
  } else {
    result <- c(result,"face")
  }
  }
  result
}
pile_ou_face(4)

pile_ou_face <- function(n) {
  # Initialiser un vecteur pour stocker les résultats
  resultats <- character(n)
  
  # Boucle pour effectuer n tirages
  for (i in 1:n) {
    alea <- runif(1)  # Générer un nombre aléatoire entre 0 et 1
    if (alea < 0.5) {
      resultats[i] <- "pile"  # Stocker "pile" si inférieur à 0.5
    } else {
      resultats[i] <- "face"  # Sinon, stocker "face"
    }
  }
  
  # Retourner le vecteur des résultats
  return(resultats)
}
pile_ou_face <- function(n) {
  # Initialiser un vecteur pour stocker les résultats
  resultats <- character(n)
  
  # Boucle pour effectuer n tirages
  for (i in 1:n) {
    alea <- runif(1)  # Générer un nombre aléatoire entre 0 et 1
    if (alea < 0.5) {
      resultats[i] <- "pile"  # Stocker "pile" si inférieur à 0.5
    } else {
      resultats[i] <- "face"  # Sinon, stocker "face"
    }
  }
  
  # Retourner le vecteur des résultats
  return(resultats)
}
pile_ou_face(4)

pile_ou_face <- function(n) {
  # Générer n nombres aléatoires entre 0 et 1
  alea <- runif(n)
  
  # Retourner "pile" si le nombre est inférieur à 0.5, sinon "face"
  resultats <- ifelse(alea < 0.5, "pile", "face")
  
  return(resultats)
}
pile_ou_face(4)
