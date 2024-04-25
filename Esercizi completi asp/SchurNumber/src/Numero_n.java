import it.unical.mat.embasp.languages.Id;
import it.unical.mat.embasp.languages.Param;


@Id("numero_n")
public class Numero_n {
    @Param(0)
    private int n;

    public Numero_n() {
    }

    public Numero_n(int n) {
        this.n = n;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }
}
