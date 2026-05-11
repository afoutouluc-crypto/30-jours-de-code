#include <stdio.h>
#include <stdlib.h>

// Jour 11 - Tri par sélection en C
// Niveau L2 - Algorithmique

void tri_selection(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int min_idx = i;
        for (int j = i + 1; j < n; j++)
            if (arr[j] < arr[min_idx]) min_idx = j;
        int tmp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = tmp;
    }
}

void afficher(int arr[], int n) {
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
}

int main() {
    int arr[] = {64, 25, 12, 22, 11};
    int n = sizeof(arr) / sizeof(arr[0]);
    printf("Avant : "); afficher(arr, n);
    tri_selection(arr, n);
    printf("Après : "); afficher(arr, n);
    return 0;
}