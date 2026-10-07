class Cachorro {
    String raca;
    int idade;

    public Cachorro(String raca, int idade) {
        this.raca = raca;
        this.idade = idade;
    }

    public boolean latir() {
        System.out.println("O cachorro está latindo");
        return true;
    }

    public boolean dormir() {
        System.out.println("O cachorro está dormindo");
        return true;
    }
}