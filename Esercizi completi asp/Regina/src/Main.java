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

    private static Handler handler;

    private static String encodingResource="encodings/regine";


    public static int[][] matrice = {
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0},
            {0,0,0,0,0,0,0,0}
    };



    public static void main(String[] args) {

        handler = new DesktopHandler(new DLV2DesktopService("lib/dlv2"));
        try {
            ASPMapper.getInstance().registerClass(Cell.class);
        } catch (ObjectNotValidException | IllegalAnnotationException e1) {
            e1.printStackTrace();
        }

        //Specifichiamo il programma logico tramite file
        InputProgram encoding= new ASPInputProgram();
        encoding.addFilesPath(encodingResource);


        //Aggiungiamo all'handler il programma logico
        handler.addProgram(encoding);

        //L'handler invoca DLV2 in modo SINCRONO dando come input il programma logico e i fatti
        Output o =  handler.startSync();

        AnswerSets answersets = (AnswerSets) o;

        for(AnswerSet a:answersets.getAnswersets()){
            try {
                System.out.println("CAZZONE");
                for(Object obj:a.getAtoms()){
                    System.out.println(obj);
                    //Scartiamo tutto ci� che non � un oggetto della classe Cell
                    if(!(obj instanceof Cell)) continue;
                    //Convertiamo in un oggetto della classe Cell e impostiamo il valore di ogni cella
                    //nella matrice rappresentante la griglia del Sudoku
                    Cell cell= (Cell) obj;
                    matrice[cell.getRow()][cell.getColumn()] = 1;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //printo la matrice

        for(int i=0;i<8;i++){
            for(int j=0;j<8;j++){
                System.out.print(matrice[i][j] + " ");
            }
            System.out.println();
        }




    }
}