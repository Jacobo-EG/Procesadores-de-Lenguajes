import java.io.FileReader;
import java.io.IOException;

public class srt {
    
    protected static int numSub = 0;
    protected static int numLineas = 0;
    protected static int numPalabras = 0;
    protected static int seg = 0;

    public static void add(int x) {

    }
    
    public static int getSuma() {
    	return 0;
    }
    
    public static void reset() {
        
    }
    
    
    public static void main (String arg[]) {
    
        int i;
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
		while (  (i = lex.yylex()) != -1  ) {

        }
                System.out.println("NUM_SUBTITULOS " + numSub);
                System.out.println("TIEMPO_TOTAL " + seg);
                System.out.println("NUM_LINEAS " + numLineas);
                System.out.println("NUM_PALABRAS " + numPalabras);
        
	    } catch (IOException e) {
	    
        }
        }
    }

}
