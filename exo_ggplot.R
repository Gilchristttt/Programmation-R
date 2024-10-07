library(tidyverse)
library(questionr)
data(rp2018)
rp69 <- filter(rp2018, departement %in% c("Rhône", "Loire"))

## Exercice 1 ----
ggplot(rp69) +
  geom_point(aes(x=dipl_aucun, y=ouvr))

## Exercice 2 ----

ggplot(rp69) +
  geom_point(aes(x=dipl_aucun, y=ouvr,alpha = 0.2))

## Exercice 3 ----

ggplot(rp69) +
  geom_boxplot(aes(x=pop_cl,y=proprio))

## Exercice 4 ----
ggplot(rp69) +
  geom_bar(aes(x=pop_cl))

## Exercice 5 ----

ggplot(rp69)+
  geom_point(aes(x=dipl_aucun, y=ouvr, colour = departement))

ggplot(rp69)+
  geom_point(aes(x=dipl_aucun, y=ouvr,
                 colour = departement, size= pop_tot,
                 alpha = 0.5))
## Exercice 6 ----

ggplot(rp69) +
  geom_boxplot(aes(y=proprio, x=pop_cl, fill = departement))
  
## Exercice 7 ----

ggplot(rp69)+
  geom_bar(aes(x=pop_cl, fill = departement))

ggplot(rp69)+
  geom_bar(aes(x=pop_cl, fill = departement), position="dodge")

ggplot(rp69)+
  geom_bar(aes(x=pop_cl, fill = departement), position="fill")

## Exercice 8 ----

ggplot(rp69)+
  geom_point(aes(x=cadres, y=dipl_sup))+
  facet_grid(cols  = vars(departement))

ggplot(rp69)+
  geom_point(aes(x=cadres, y=dipl_sup, size = pop_tot, alpha = 0.5))+
  facet_grid(cols  = vars(departement))

## Exercice 9 ----

ggplot(rp69, aes(x=chom, y= dipl_aucun))+
  geom_point(alpha=0.2)+
  geom_text(aes(label = commune),size = 2.5,colour = "red")

ggplot(rp69, aes(x=chom, y= dipl_aucun))+
  geom_point(alpha=0.2)+
  geom_text(data=rp69[rp69$pop_chom/100 >=0.15,]  aes(label = commune),size = 2.5,colour = "red")
