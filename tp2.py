from random import randint
## Exercice 1 -----
liste = ['Yoda, Jedi', 'Kilo Ren, Sith', 'Luke Skywal-ker, Jedi', 'Chewbacca, Wookiee', 'Rey, Jedi', 'Leia Organa, Princesse' , 'Han Solo, Contrebandier']
#print(liste)

## Exercice 2 -----
#print(liste[2])

## Exercice 3 -----
"""
for i in range(5):
    print(liste[i])
"""

## Exercice 4 -----

lst = []
for i in range(1,len(liste)+1):
    lst.append(liste[-i] )
#print(lst)

## Exercice 5 -----
liste.sort()
#print(liste)

## Exercice 6 -----
liste.append('Dark Vador, Sith')
#print(liste)


####  Exercices recherche d’élements --------


"""
liste_val = []
for i in range(10):
    liste_val.append(randint(1,100))
print(liste_val)
"""
liste_val = [23, 77, 10, 55, 21, 11, 8, 47, 51, 35]
## Exercice 7 ---------
elem = int(input("entrer une valeur : "))

"""
cmpt = 0
for val in liste_val:
    if val == elem:
        print(True)
        break
    cmpt +=1
    if cmpt == len(liste_val):
        print(False)
"""       
"""
cmpt_w = 0
while cmpt_w <= len(liste_val) :
    cmpt_w += 1
    if liste_val[cmpt_w] == elem:
        print(True)
        break
    elif cmpt_w == len(liste_val)-2 and liste_val[cmpt_w+1] != elem:
        print(False)
        break
"""
## Exercice 8 ---------
liste_val.sort()
"""
cmpt = 0

for val in liste_val:
    if val == elem:
        print(True)
        break
    cmpt +=1
    if elem > liste_val[-1] or cmpt == len(liste_val):
        print(False)
        break
"""
"""
cmpt_w = 0
while cmpt_w < len(liste_val) :
    
    if liste_val[cmpt_w] == elem:
        print(True)
        break
    
    elif elem > liste_val[-1] or cmpt_w == len(liste_val)-1:
        print(False)
        break
    cmpt_w += 1
    
print(liste_val)

"""