import it.unical.mat.embasp.languages.Id;
import it.unical.mat.embasp.languages.Param;

@Id("s")
public class S {
    @Param(0)
    private int k;

    public S() {
    }

    public S(int k) {
        this.k = k;
    }

    public int getK() {
        return k;
    }

    public void setK(int k) {
        this.k = k;
    }





}
