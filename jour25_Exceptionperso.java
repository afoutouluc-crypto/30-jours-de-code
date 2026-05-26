// Jour 25 - Exceptions personnalisées
// Niveau L2 - Java, gestion des erreurs
 
class CompteException extends Exception {
    public CompteException(String message) { super(message); }
}
 
class SoldeInsuffisantException extends CompteException {
    private double solde;
    private double montant;
    public SoldeInsuffisantException(double solde, double montant) {
        super(String.format("Solde insuffisant : %.2f€ disponible, %.2f€ demandé", solde, montant));
        this.solde = solde;
        this.montant = montant;
    }
    public double getManque() { return montant - solde; }
}
 
class CompteBancaire {
    private String titulaire;
    private double solde;
 
    public CompteBancaire(String titulaire, double soldeInitial) {
        this.titulaire = titulaire;
        this.solde = soldeInitial;
    }
 
    public void deposer(double montant) throws CompteException {
        if (montant <= 0) throw new CompteException("Le montant doit être positif");
        solde += montant;
        System.out.printf("Dépôt de %.2f€ => Solde : %.2f€%n", montant, solde);
    }
 
    public void retirer(double montant) throws CompteException {
        if (montant <= 0) throw new CompteException("Le montant doit être positif");
        if (montant > solde) throw new SoldeInsuffisantException(solde, montant);
        solde -= montant;
        System.out.printf("Retrait de %.2f€ => Solde : %.2f€%n", montant, solde);
    }
}
 
public class ExceptionsPerso {
    public static void main(String[] args) {
        CompteBancaire compte = new CompteBancaire("Alice", 500.0);
        try {
            compte.deposer(200.0);
            compte.retirer(100.0);
            compte.retirer(700.0); // Doit lever une exception
        } catch (SoldeInsuffisantException e) {
            System.out.println("ERREUR : " + e.getMessage());
            System.out.printf("Il manque %.2f€%n", e.getManque());
        } catch (CompteException e) {
            System.out.println("Erreur compte : " + e.getMessage());
        }
    }
}
 