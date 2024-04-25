import it.unical.mat.embasp.base.Handler;
import it.unical.mat.embasp.base.InputProgram;
import it.unical.mat.embasp.base.Output;
import it.unical.mat.embasp.languages.IllegalAnnotationException;
import it.unical.mat.embasp.languages.ObjectNotValidException;
import it.unical.mat.embasp.languages.asp.ASPInputProgram;
import it.unical.mat.embasp.languages.asp.ASPMapper;
import it.unical.mat.embasp.languages.asp.AnswerSet;
import it.unical.mat.embasp.languages.asp.AnswerSets;
import it.unical.mat.embasp.platforms.desktop.DesktopHandler;
import it.unical.mat.embasp.specializations.dlv.desktop.DLVDesktopService;
import it.unical.mat.embasp.specializations.dlv2.desktop.DLV2DesktopService;

public class Main {

    public static int[][] matrice = {
            {0,0,0,0},
            {0,0,0,0},
            {0,0,9,0},
            {9,0,0,0}
    };

    private static Handler handler;

    private static String encodingResource="encodings/tiles";

    public static void main(String[] args) {

        handler = new DesktopHandler(new DLV2DesktopService("lib/dlv2"));
        try {
            ASPMapper.getInstance().registerClass(Cell.class);
        } catch (ObjectNotValidException | IllegalAnnotationException e1) {
            e1.printStackTrace();
        }

        InputProgram encoding= new ASPInputProgram();
        encoding.addFilesPath(encodingResource);

        handler.addProgram(encoding);

        Output o =  handler.startSync();

        AnswerSets answersets = (AnswerSets) o;
        System.out.println(answersets.getAnswersets().size());

        for(AnswerSet a:answersets.getAnswersets()){
            System.out.println("Risultato:");


            try {

                for(Object obj:a.getAtoms()) {

                    System.out.println(obj);

                    if(!(obj instanceof Cell)) continue;

                    Cell cell= (Cell) obj;
                    matrice[cell.getRow()][cell.getColumn()] = cell.getTile();


                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // printo la matrice

        for(int i=0;i<matrice.length;i++){
            for(int j=0;j<matrice[i].length;j++){
                System.out.print(matrice[i][j]+" ");
            }
            System.out.println();
        }




    }

    

}