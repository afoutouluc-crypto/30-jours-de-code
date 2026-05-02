// Jour 02 - Tri à bulles (Bubble Sort)
// Niveau L2 - Algorithmique & Complexité

public class BubbleSort {

    public static void bubbleSort(int[] arr) {
        int n = arr.length;
        // Complexité : O(n²) dans le pire cas
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    // Échange
                    int temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }

    public static void afficher(int[] arr) {
        for (int val : arr) System.out.print(val + " ");
        System.out.println();
    }

    public static void main(String[] args) {
        int[] tableau = {64, 34, 25, 12, 22, 11, 90};
        System.out.println("Avant le tri :");
        afficher(tableau);
        bubbleSort(tableau);
        System.out.println("Après le tri :");
        afficher(tableau);
    }
}