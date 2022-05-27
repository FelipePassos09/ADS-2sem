public class Felino {

    private String especie;
    private String tamanho;
    private Boolean domestico;

    public Felino(String especie, String tamanho, Boolean domestico) {
        this.especie = especie;
        this.tamanho = tamanho;
        this.domestico = domestico;
    }

public static void main(String[] args){

    Felino gato = new Felino("Gato", "Pequeno", true);
    Felino tigre = new Felino("Tigre", "Grande", false);

System.out.println("Especie 1: " + gato.especie + " " + gato.tamanho + " " + gato.domestico);
System.out.println("Especie 2: " + tigre.especie + " " + tigre.tamanho + " " + tigre.domestico);

}}