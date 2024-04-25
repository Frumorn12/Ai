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

import java.lang.reflect.InvocationTargetException;
import java.util.Scanner;

public class Main {


    private static String encodingResource="encodings/schur";
    public static void main(String[] args) {
        Handler  handler = new DesktopHandler(new DLV2DesktopService("lib/dlv2"));

        System.out.println("Il numero di Schur è composto cosi S(k) = n. Inserire prima k e poi n per controllare se n e` un numero di Schur. " + "\n");
        System.out.println("Inserire k: ");
        Scanner scanner = new Scanner(System.in);
        int k = scanner.nextInt();
        System.out.println("Inserire n: ");
        int n = scanner.nextInt();



        try {
            ASPMapper.getInstance().registerClass(S.class);
            ASPMapper.getInstance().registerClass(Numero_n.class);
            ASPMapper.getInstance().registerClass(Assegnamento.class);
        } catch (ObjectNotValidException | IllegalAnnotationException e1) {
            e1.printStackTrace();
        }
        System.out.println("Hello World!");


        InputProgram facts = new ASPInputProgram();


        try {
            for (int i = 1; i <= k; i++) {
                S s = new S(i);
                facts.addObjectInput(s);
            }
            for (int i = 1; i <= n; i++) {
                Numero_n numero_n = new Numero_n(i);
                facts.addObjectInput(numero_n);
            }
            System.out.println("Facts: " + facts.getPrograms());

        } catch (Exception e) {
            e.printStackTrace();
        }

        handler.addProgram(facts);

        InputProgram encoding= new ASPInputProgram();
        encoding.addFilesPath(encodingResource);

        handler.addProgram(encoding);

        Output o =  handler.startSync();

        AnswerSets answersets = (AnswerSets) o;

        System.out.println("\n");

        if ((answersets.getAnswersets().size() > 0)) {

            facts = new ASPInputProgram();
            try {
                facts.addObjectInput(new Numero_n(n+1));
            } catch (Exception e) {
                e.printStackTrace();
            }
            handler.addProgram(facts);
            o = handler.startSync();
            AnswerSets answersets1 = (AnswerSets) o;
            if (answersets1.getAnswersets().size()>0) {
                System.out.println("Il numero " + n + " non è un numero di Schur");


                return;
            }

            System.out.println("Il numero " + n + " e` un numero di Schur");

            for (AnswerSet a : answersets.getAnswersets()) {
                System.out.println("Answer Set: " + a.getAnswerSet());
                try {
                    for (Object obj : a.getAtoms()) {
                        if (obj instanceof Assegnamento) {
                            Assegnamento assegnamento = (Assegnamento) obj;
                            System.out.println("S(" + assegnamento.getK() + ") = " + assegnamento.getN());
                        }
                    }
                } catch (Exception e){
                    e.printStackTrace();
            }}
        } else {
            System.out.println("Il numero " + n + " non e` un numero di Schur");
        }


        scanner.close();

    }}
