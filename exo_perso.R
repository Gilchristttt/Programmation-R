rep(1:3,times=  2)
rep(1:3,each=  2)

library(tidyverse)
library(nycflights13)
data(flights)
data(airports)
data(airlines)

# Dplyr ------

slice(airports,10)
slice(airlines,1:5)

slice_min(airports,airports$alt)

filter(flights,month==7)

filter(flights,5<= arr_delay & arr_delay <= 15 )

filter(flights,carrier %in% c("DL","UA","AA"))

arrange(flights,desc(flights$dep_delay))

airports %>%
  select(name, lat, lon)

airports %>%
  select(-starts_with("tz"))

flights %>% 
  select(ends_with("delay"))

airports %>%
  rename(altitude=alt,fuseau_horaire=tzone)

airports %>%
  mutate(alt_m = alt/3.2808) %>%
  select(alt, alt_m)

flights %>%
  filter(dest== "SFO") %>%
  arrange(desc(dep_delay))

flights %>%
  filter(month %in% c(9,10)) %>%
  mutate(retard_h= dep_delay/ 60) %>%
  select(dest, dep_delay, retard_h) %>%
  arrange(desc(retard_h)) %>%
  slice(1:5)
  #slice_max(1:5)

# groupe_by

flights %>%
  group_by(month) %>%
  summarise(n = n())

flights %>%
  group_by(month) %>%
  summarise(n = n()) %>%
  arrange(n)

flights %>%
  group_by(origin) %>%
  summarise(distance_moyenne = mean(distance))

flights %>%
  group_by(month)%>%
  filter(dest == "LAX") %>%
  summarise(n= n())

flights %>%
  group_by(month,dest) %>%
  summarise(n = n())

flights %>%
  group_by(month,dest) %>%
  summarise(n = n()) %>%
  filter(n == max(n))

flights %>%
  group_by(month) %>%
  summarise(n = n()) %>%
  mutate(Pourcentage = (n/sum(n))*100) %>%
  select(month,n, Pourcentage)
  
flights %>%
  group_by(origin, dest) %>%
  summarise(duree_moyenne = mean(air_time, na.rm = TRUE)) 
  filter(duree_moyenne == max(duree_moyenne))
 
#Jointures ----

table <- left_join(flights, airlines)

table %>%
  group_by(name) %>%
  summarise(retard_moyen = mean(dep_delay, na.rm = TRUE))%>%
  arrange(desc(retard_moyen))
  
table_b <- left_join(flights, airports,by = c("dest"="faa"))

table_b %>%
  group_by(month,name) %>%
  summarise(n= n()) %>%
  filter(n == min(n))

table_b %>%
  select(origin ,dest)
          