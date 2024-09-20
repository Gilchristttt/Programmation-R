## Croisement de deux variables qualitatives----
library(questionr)
data(hdv2003)
d <- hdv2003

tab <- table(d$qualif,d$sexe)
lprop(tab)
cprop(tab)

chisq.residuals(tab)

mosaicplot(tab,shade=TRUE)

boxplot(d$age ~ d$sport)

library(dplyr)

d_sport <- filter(d,sport=="Oui")
d_nonsport <- filter(d,sport=="Non")

mean(d_sport$age)
mean(d_nonsport$age)

tapply(d$age, d$sport, mean)

t.test(d$age ~ d$sport)

hist(d_sport$age)
hist(d_nonsport$age)

shapiro.test(d_sport$age)
shapiro.test(d_nonsport$age)

wilcox.test(d$age ~ d$sport)

data(rp2018)

plot(rp2018$cadres, rp2018$proprio)

plot(rp2018$cadres, rp2018$dipl_sup)

cor(rp2018$cadres,rp2018$dipl_sup)
cor(rp2018$cadres, rp2018$proprio)

cor(rp2018$cadres,rp2018$dipl_sup,method = "spearman")

reg <- lm(rp2018$cadres ~ rp2018$dipl_sup)
summary(reg)

plot(rp2018$dipl_sup, rp2018$cadres)
abline(reg, col = "red")


### Exercices -----
#### Exo 1 ----
tab_cat <- table(hdv2003$qualif,hdv2003$clso)
# la variable dependante est qualif
# la variable independante est clso

lprop(tab_cat)
cprop(tab_cat)
chisq.residuals(tab_cat)
chisq.test(tab_cat)
# Oui on rejete l’hypothèse d’indépendance car p-value =0.0002418 <0.05

mosaicplot(tab_cat,main = "Mosaic Plot des Résidus du Test du Chi Deux",shade = TRUE)


#### Exo 2 ----

boxplot(hdv2003$heures.tv ~ hdv2003$occup,
        xlab = "Statut d'occupation", 
        ylab = "Heures passées devant la télévision",
        main = "Boxplot des heures passées devant la télévision selon le statut d'occupation",
        col = "lightblue")
m_heure <-tapply(hdv2003$heures.tv, hdv2003$occup, mean,na.rm = TRUE)

df_m <- data.frame(
  statutoccup <-names(m_heure),  
  m_heure_tv <- m_heure
)

barplot(df_m$m_heure_tv....m_heure,
        names.arg = df_m$statutoccup....names.m_heure )

#### Exo 3 -------

plot(rp2018$dipl_aucun, rp2018$proprio)
cor(rp2018$dipl_aucun, rp2018$proprio)

## ggplot2 ----

library(ggplot2)
rp <- filter(
  rp2018,
  departement %in% c("Oise", "Rhône", "Hauts-de-Seine", "Lozère", "Bouches-du-Rhône")
)

#Initialisation
ggplot(rp)

# choix du geom
ggplot(rp)+
  geom_histogram(aes(x=ouvr))

ggplot(rp)+
  geom_point(aes(x = dipl_sup, y = cadres))

#cor(rp$dipl_sup,rp$cadres)
#r <- lm(rp$dipl_sup ~ rp$cadres)
#plot( rp$cadres,rp$dipl_sup)
#abline(r,col="red")

ggplot(rp) +
  geom_point(
    aes(x = dipl_sup, y = cadres),
    color = "darkgreen", size = 3, alpha = 0.3
  )
#

ggplot(rp) +
  geom_boxplot(aes(x = departement, y = maison))

#

ggplot(rp) +
  geom_boxplot(
    aes(x = departement, y = maison),
    fill = "wheat", color = "tomato4"
  )
#varwidth, permet de faire varier la largeur des 
# boîtes en fonction des effectifs de la classe

ggplot(rp) +
  geom_boxplot(aes(x = departement, y = maison), varwidth = TRUE)

#
ggplot(rp) +
  geom_violin(aes(x = departement, y = maison))

#
ggplot(rp) +
  geom_violin(
    aes(x = departement, y = maison),
    bw = 2
  )
#
ggplot(rp) +
  geom_bar(aes(x = departement))
#
ggplot(rp) +
  geom_bar(aes(y = departement))

#coord_flip() peut s’appliquer à n’importe quel graphique ggplot2
ggplot(rp) +
  geom_bar(aes(x = departement)) +
  coord_flip()
#
ggplot(rp) +
  geom_text(
    aes(x = dipl_sup, y = cadres, label = commune)
  )
#
ggplot(rp) +
  geom_label(aes(x = dipl_sup, y = cadres, label = commune))
#
ggplot(rp) +
  geom_density(aes(x = cadres))
#
ggplot(rp) +
  geom_density(aes(x = cadres), bw = 1)

##
data(economics)
economics

ggplot(economics) +
  geom_line(aes(x = date, y = unemploy))
#
ggplot(rp2018) +
  geom_bin2d(aes(x = cadres, y = dipl_sup))
#
ggplot(rp) +
  geom_point(
    aes(x = dipl_sup, y = cadres, color = departement)
  )
#
ggplot(rp) +
  geom_point(
    aes(x = dipl_sup, y = cadres, color = departement, size = pop_tot)
  )
#
ggplot(rp) +
  geom_point(
    aes(x = dipl_sup, y = cadres, color = departement, size = pop_tot)
  )
#
ggplot(rp) +
  geom_bar(aes(x = departement, fill = pop_cl))
#
ggplot(rp) +
  geom_bar(
    aes(x = departement, fill = pop_cl),
    position = "dodge"
  )
#
ggplot(rp) +
  geom_boxplot(aes(x = departement, y = maison)) +
  geom_point(
    aes(x = departement, y = maison),
    col = "red", alpha = 0.2
  )+labs(title = "ggplot2 geom_bar() test")
#
ggplot(rp) +
  geom_boxplot(aes(x = departement, y = maison)) +
  geom_jitter(
    aes(x = departement, y = maison),
    col = "red", alpha = 0.2
  )
#
ggplot(rp, aes(x = dipl_sup, y = cadres)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm") + theme(panel.background = element_rect(fill = "gray84"))
#
ggplot(data = rp) +
  geom_histogram(aes(x = cadres)) +
  facet_wrap(vars(departement))


### Exercice ----
library(tidyverse)
library(questionr)
data(rp2018)
rp69 <- filter(rp2018, departement %in% c("Rhône", "Loire"))

#### Exercice 1------

ggplot(rp69)+
  geom_point(aes(x=dipl_aucun,y=ouvr))

#### Exercice 2------
ggplot(rp69)+
  geom_point(aes(x=dipl_aucun,y=ouvr),
             color="red",alpha=0.2)

#### Exercice 3------
ggplot(rp69)+
  geom_boxplot(aes(y=proprio,x=pop_cl))

#### Exercice 4------
ggplot(rp69)+
  geom_bar(aes(x=pop_cl))

#### Exercice 5------
ggplot(rp69)+
  geom_point(aes(x=dipl_aucun,y=ouvr,colour = departement,size = pop_tot),
             alpha=0.5)

#### Exercice 6------
ggplot(rp69) +
  geom_boxplot(aes(y = proprio, x = pop_cl,fill = departement))

#### Exercice 7------
ggplot(rp69) +
  geom_bar(aes(x = pop_cl, fill = departement))

## Recoder des variable -----
f <- c("Pomme", "Poire", "Pomme", "Cerise")
#Changer des données 
f <- fct_recode(
  f,
  "Fraise" = "Pomme",
  "Ananas" = "Poire")
  
#, si on souhaite recoder les NA d’une variable, on utilisera 
#la fonction fct_explicit_na
# Ex
#fct_explicit_na(hdv2003$qualif, na_level = "(Manquant)")

#fct_other, qui regroupe une liste de modalités en une seule modalité “Other”
# Ex
# fct_other(
#hdv2003$qualif,drop = c("Ouvrier specialise", 
#"Ouvrier qualifie", "Cadre", "Autre")

#case_when est une généralisation du ifelse
hdv2003$statut <- case_when(
  hdv2003$sexe == "Homme" & hdv2003$age > 60 ~ "Homme de plus de 60 ans",
  hdv2003$sexe == "Homme" ~ "Homme",
  TRUE ~ "Autre"
)
freq(hdv2003$statut)

## Manipuler les données avec dplyr -------

