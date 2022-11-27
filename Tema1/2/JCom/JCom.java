import java.io.FileReader;
import java.io.IOException;

public class JCom {
    
    protected static int tipo1 = 0;
    protected static int tipo2 = 0;
    protected static int tipo3 = 0; 
    
    public static void main(String arg[]) {
    
        int i;
        if (arg.length>0) {
            try {
                Yylex lex = new Yylex(new FileReader(arg[0]));
		while (  (i = lex.yylex()) != -1  ) {
            /*if(i == 1){
                JCom.tipo1 += lex.yylength();
            }else if(i == 2){
                JCom.tipo2 += lex.yylength();
            }else if(i == 3){
                JCom.tipo3 += lex.yylength();
            }*/
        }
                System.out.println("// " +tipo1);
                System.out.println("/* " +tipo2);
                System.out.println("/** " +tipo3);
        
	    } catch (IOException e) {
	    
        }
        }
    }

}