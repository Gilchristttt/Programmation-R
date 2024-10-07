n=10
prod(1:n)
demo(graphics)
#-------------------------DEBUT--------------------------------

ozone <- read.table("Programmation-R/data/ozone.txt",header = T)

ozone <- ozone[,c("T12","maxO3","vent","pluie","Vx12")]
summary(ozone)

#----------------GEOLOCALISATION--------------------------------

##1
villes <- read.csv2("Programmation-R/data/villes.csv")
villes <- villes[,1]

##2
adresse <- paste(villes,"France", sep = ",")

##3
coords <- data.frame(matrix(NA,nrow = 30, ncol = 2))
colnames(coords) <- c("lat","long")
rownames(coords) <- villes
coords



#
#------------------INTERVALLE DE CONFIANCE-----------------------

#1 IMPORTER LES DATA

Donnees <- read.table("Programmation-R/data/poulpe.csv",header = T,sep = ";")


