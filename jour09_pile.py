# Jour 09 - Pile (Stack) en Python
# Niveau L2 - Structures de données

class Pile:
    """Implémentation d'une pile (LIFO)."""

    def __init__(self):
        self._elements = []

    def empiler(self, valeur):
        """Ajoute un élément au sommet."""
        self._elements.append(valeur)

    def depiler(self):
        """Retire et retourne l'élément du sommet."""
        if self.est_vide():
            raise IndexError("Pile vide")
        return self._elements.pop()

    def sommet(self):
        """Retourne l'élément du sommet sans le retirer."""
        if self.est_vide():
            raise IndexError("Pile vide")
        return self._elements[-1]

    def est_vide(self):
        return len(self._elements) == 0

    def taille(self):
        return len(self._elements)

    def __str__(self):
        return f"Pile{self._elements} <- sommet"


def verifier_parentheses(expression):
    """Utilise une pile pour vérifier l'équilibrage des parenthèses."""
    pile = Pile()
    paires = {')': '(', ']': '[', '}': '{'}
    for char in expression:
        if char in '([{':
            pile.empiler(char)
        elif char in ')]}':
            if pile.est_vide() or pile.sommet() != paires[char]:
                return False
            pile.depiler()
    return pile.est_vide()


if __name__ == "__main__":
    p = Pile()
    p.empiler(10)
    p.empiler(20)
    p.empiler(30)
    print(p)
    print(f"Dépiler : {p.depiler()}")
    print(p)

    exprs = ["(a + b) * [c - d]", "((x + y)", "{[()]}"]
    for e in exprs:
        print(f"'{e}' => {'OK' if verifier_parentheses(e) else 'ERREUR'}")