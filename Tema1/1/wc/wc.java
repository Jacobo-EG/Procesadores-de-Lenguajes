import java.io.FileReader;
import java.io.IOException;

public class wc {
    
    protected static int palabras = 0;
    protected static int lineas = 0;
    protected static int caracter = 0;

    public static void add(int x) {

    }
    
    public static int getSuma() {
    	return 0;
    }
    
    public static void reset() {
        
    }
    
    
    public static void main(String arg[]) {
    
        int i;
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
		while (  (i = lex.yylex()) != -1  ) {
            if(i == 1){
                wc.palabras++;
                wc.caracter += lex.yylength();
            }else if(i == 2){
                wc.caracter++;
            }else if(i == 3){
                wc.lineas++;
                wc.caracter++;
            }
        }
                System.out.println(" " +lineas + " " + palabras + " " + caracter + " " + arg[0]);
        
	    } catch (IOException e) {
	    
        }
        }
    }

}
