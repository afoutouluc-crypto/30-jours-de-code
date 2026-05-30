# Jour 29 - Programmation fonctionnelle en Python
# Niveau L2 - Python, paradigme fonctionnel
 
from functools import reduce
 
# map : appliquer une fonction à chaque élément
notes = [12, 15, 8, 17, 11, 14]
notes_sur_20 = list(map(lambda x: round(x * 20 / 20, 1), notes))
notes_lettres = list(map(lambda n: 'A' if n >= 16 else 'B' if n >= 12 else 'C' if n >= 10 else 'D', notes))
 
# filter : garder seulement les éléments qui satisfont une condition
admis = list(filter(lambda n: n >= 10, notes))
echec = list(filter(lambda n: n < 10, notes))
 
# reduce : réduire une liste à une seule valeur
somme = reduce(lambda a, b: a + b, notes)
produit = reduce(lambda a, b: a * b, [1, 2, 3, 4, 5])
 
# Compréhension de liste (Pythonic)
carres_pairs = [x**2 for x in range(20) if x % 2 == 0]
 
# Fonctions lambda composées
double = lambda x: x * 2
ajouter_10 = lambda x: x + 10
composer = lambda f, g: lambda x: f(g(x))
double_puis_plus10 = composer(ajouter_10, double)
 
if __name__ == "__main__":
    print(f"Notes         : {notes}")
    print(f"Notes lettres : {notes_lettres}")
    print(f"Admis (≥10)   : {admis}")
    print(f"Échec (<10)   : {echec}")
    print(f"Somme         : {somme}")
    print(f"Produit 1..5  : {produit}")
    print(f"Carrés pairs  : {carres_pairs}")
    print(f"double_puis_+10(7) = {double_puis_plus10(7)}")
 