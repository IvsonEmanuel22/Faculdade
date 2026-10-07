public class Main {
    public static void main(String[] args) {

        Cachorro C = new Cachorro("Pitbull", 21);
        Moto M = new Moto();
        Celular cell = new Celular();
        Notebook note = new Notebook();
        Cadeira cadeira = new Cadeira();

        if (C.latir()) {
            C.dormir();
        }

        if (M.frear()) {
            M.acelerar();
        }

        if (cell.ligar()) {
            cell.desligar();
        }

        if (note.ligar()) {
            note.carregando();
        }

        if (cadeira.estaDisponivel()) {
            System.out.println("Pode sentar");
        }
    }
}