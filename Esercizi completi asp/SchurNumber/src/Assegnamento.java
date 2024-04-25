import it.unical.mat.embasp.languages.Id;
import it.unical.mat.embasp.languages.Param;

@Id("assegnamento")
public class Assegnamento {
    @Param(0)
    private int k;
    @Param(1)
    private int n;

    public Assegnamento() {
    }

    public Assegnamento(int k, int n) {
        this.k = k;
        this.n = n;
    }

    public int getK() {
        return k;
    }

    public void setK(int k) {
        this.k = k;
    }

    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

}
