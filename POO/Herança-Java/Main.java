// Exercicio Casa POO
//Incluir codigo no github e enviar no grupo da disciplina
// Aluno: Ivson Emanuel Turma: A
// 1. Implementar Raça 
// 2. Implementar ação de Voar e Andar


// Classe pai
class Animal {
    // Atributo
    String nome;

    // Construtor
    public Animal(String nome) {
        this.nome = nome;
    }

    // Método
    public void comer() {
        System.out.println(nome + " está comendo.");
    }
}

// Classe filha, que herda de Animal
class Cachorro extends Animal {
     
    String raca;

    // Construtor da classe filha
    public Cachorro(String nome, String raca) {
        // Chama o construtor da classe pai
        // Isso é necessário para inicializar os atributos herdados
        super(nome);
        this.raca = raca;
    }

    // Método específico da classe Cachorro
    public void latir() {
        System.out.println(nome + " está latindo: Au au!");
    }
}

class Ave extends Animal{

    String especie;   

    public Ave(String nome, String especie){

        super(nome);
        this.especie = especie;

    }

    public void voar(){
        System.out.println(nome + " está voando!");
    }
    
}

// Classe principal
public class Main {
    public static void main(String[] args) {
        // Criando um objeto da classe filha Cachorro
        Cachorro meuCachorro = new Cachorro("Rex", "Labrador");

        // Usando o método herdado da classe pai (Animal)
        System.out.println("Nome do cachorro: " + meuCachorro.nome);
        System.out.println("Raça do cachorro: " + meuCachorro.raca);
        meuCachorro.comer();

        // Usando o método específico da classe filha (Cachorro)
        meuCachorro.latir();

        Ave minhaAve = new Ave("Nagel", "Cacatua");

        System.out.println("Nome da ave: " + minhaAve.nome);
        System.out.println("Especie da ave: " + minhaAve.especie);
        minhaAve.comer();

        // Voar
        minhaAve.voar();
    }
}