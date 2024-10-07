liste = ['Yoda, Jedi', 'Kilo Ren, Sith', 'Luke Skywal-ker, Jedi', 'Chewbacca, Wookiee', 'Rey, Jedi', 'Leia Organa, Princesse' , 'Han Solo, Contrebandier']
"""
for elem in liste :
    print(elem)
"""  
    
#[print(jedi) for jedi in liste]


jed = [name for name in liste if " Jedi" in name]
sith = [name for name in liste if " Sith" in name]
"""
jed = []
sith = []
for a in liste:
    s = a.split(",")
    if " Jedi" in s:
        jed.append(a)
    elif " Sith" in s:
        sith.append(a)
"""
#print(jed)
#print(sith)

