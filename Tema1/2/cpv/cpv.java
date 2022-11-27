import java.io.FileReader;
import java.io.IOException;

public class cpv {
    
    protected static int a = 0;
    protected static int b = 0;
    protected static int c = 0;
    protected static int d = 0;

    public static void add(int x) {

    }
    
    public static int getSuma() {
    	return 0;
    }
    
    public static void reset() {
        
    }
    
    
    public static void main(String arg[]) {
    
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
                Yytoken yytoken = null;
		while (  (yytoken = lex.yylex()) != null  ) {
                    if (yytoken.getToken() == Yytoken.A)  {
                       a++;
                    } else if (yytoken.getToken() == Yytoken.B) {
                        b++;
                    } else if (yytoken.getToken() == Yytoken.C) {
                        c++;
                    } else if (yytoken.getToken() == Yytoken.D) {
                        d++;
                    } else if (yytoken.getToken() == Yytoken.EOLN) {
                    } 
                }
                System.out.println("A "+a);
                System.out.println("B "+b);
                System.out.println("C "+c);
                System.out.println("D "+d);
	    } catch (IOException e) {
	    }
        }
    }

}