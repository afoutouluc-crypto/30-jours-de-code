#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
// Jour 28 - Structures et fichiers en C
// Niveau L2 - Programmation C
 
typedef struct {
    int id;
    char nom[50];
    float note;
} Etudiant;
 
void afficher_etudiant(Etudiant e) {
    printf("ID: %d | Nom: %-20s | Note: %.2f\n", e.id, e.nom, e.note);
}
 
void sauvegarder(Etudiant *etudiants, int n, const char *fichier) {
    FILE *f = fopen(fichier, "w");
    if (!f) { perror("Erreur ouverture"); return; }
    for (int i = 0; i < n; i++)
        fprintf(f, "%d;%s;%.2f\n", etudiants[i].id, etudiants[i].nom, etudiants[i].note);
    fclose(f);
    printf("Sauvegardé dans %s\n", fichier);
}
 
float moyenne(Etudiant *etudiants, int n) {
    float somme = 0;
    for (int i = 0; i < n; i++) somme += etudiants[i].note;
    return somme / n;
}
 
int main() {
    Etudiant promo[] = {
        {1, "Alice Martin", 15.5f},
        {2, "Bob Dupont", 12.0f},
        {3, "Clara Petit", 18.0f},
        {4, "David Morel", 9.5f}
    };
    int n = sizeof(promo) / sizeof(promo[0]);
 
    printf("=== Liste des étudiants ===\n");
    for (int i = 0; i < n; i++) afficher_etudiant(promo[i]);
    printf("\nMoyenne de la promo : %.2f\n", moyenne(promo, n));
 
    sauvegarder(promo, n, "etudiants.csv");
    return 0;
}
 