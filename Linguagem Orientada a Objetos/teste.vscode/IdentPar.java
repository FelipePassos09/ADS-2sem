import java.util.*;

public class IdentPar {

    public static void main(String[] args){
            Scanner valor = new Scanner(System.in);
            System.out.println("Informe o número inteiro: ");
            int numero = valor.nextInt();

            if (numero%2 == 0){
                System.out.println("O número é Par");
            }
            else{
                System.out.println("O número é impar");
            }
    }
    




}