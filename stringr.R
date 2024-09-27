library(tidyverse)
library(questionr)
d <- tibble(
  nom = c("M. rené Bézigue", "Mme Paulette fouchin", "Mme yvonne duluc", "M. Jean-Yves Pernoud"),
  naissance = c("18/04/1937 Vesoul", "En 1947 à Grenoble (38)", "Le 5 mars 1931 à Bar-le-Duc", "Marseille, juin 1938"),
  profession = c("Ouvrier agric", "ouvrière qualifiée", "Institutrice", "Exploitant agric")
)

## Exercice 1 ----
str_to_title(d$nom)

## Exercice 2 ----
str_replace_all(d$profession, "agric", "agricole")

## Exercice 3 ----
str_detect(d$profession,regex("Ouvrier",ignore_case=TRUE))
d %>% filter(str_detect(profession, "Ouvrier|ouvrière", ignore_case = TRUE))

## Exercice 4 ----

#TIDYverse

data(hdv2003)
tab <- lprop(table(hdv2003$qualif, hdv2003$sexe))
tab

library(knitr)
kable(tab)

#digits, par exemple, permet de spécifier le nombre de chiffres
#significatifs à afficher dans les colonnes de nombres
kable(tab, digits = 1)


df <- tribble(
  ~id, ~pcs, ~pcs_pere, ~pcs_mere, ~age, ~`age enf1`, ~`age enf2`, ~`age enf3`,
  1, "5", "5", "6", 25, 2, NA, NA,
  2, "3", "3", "2", 45, 12, 8, 2,
  3, "4", "2", "5", 29, 7, NA, NA,
  4, "2", "1", "4", 32, 6, 3, NA,
  5, "1", "4", "3", 65, 39, 36, 28,
  6, "6", "6", "6", 51, 18, 12, NA,
  7, "5", "4", "6", 37, 8, 4, 1,
  8, "3", "3", "1", 42, 16, 10, 5
)
kable(df)

recode_pcs <- function(v) {
  fct_recode(v,
             "Agriculteur" = "1",
             "Indépendant" = "2",
             "Cadre" = "3",
             "Intermédiaire" = "4",
             "Employé" = "5",
             "Ouvrier" = "6"
  )
}

df %>%
  mutate(pcs = recode_pcs(pcs))

kable(df)
