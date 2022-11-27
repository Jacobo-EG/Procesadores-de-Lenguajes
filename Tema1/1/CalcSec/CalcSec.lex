import java.util.*;

%%

Numero = [0-9]+
Op = [\+\-\*\/]
InitP = \(
EndP = \)

%{
    List<Integer> nums = new ArrayList<Integer>();
    String operador;
    int valor = 0;

    private void operar(List<Integer> nums, String operador){
        int res = 0;

        if(nums.size() > 1){

            int pos1 = nums.size()-2;
            int pos2 = nums.size()-1;
            int a = nums.get(pos1);
            int b = nums.get(pos2);

            switch(operador){
                case "+":
                    res = a + b;
                    break;

                case "-":
                    res = a - b;
                    break;
            
                case "*":
                    res = a * b;
                    break;
            
                case "/":
                    res = a / b;
                    break;
            
                default:
                    System.out.println("Error");
            }

            nums.set(pos1, res);
            nums.remove(pos2);
        }
    }
%}

%int

%xstate OP PTS

%%

<YYINITIAL> {
    {Numero}    {nums.add(Integer.parseInt(yytext()));}
    {Op}      {operador = yytext(); yybegin(OP);}
    {InitP}     {yybegin(PTS);}
    {EndP}      {operar(nums,"*");}
    ;           {System.out.println(nums.get(0)); nums.clear();}
    [\s\n]      {System.out.println(nums.get(0)); nums.clear();}
}

<OP> {
    {Numero}    {nums.add(Integer.parseInt(yytext()));
                    operar(nums, operador);
                    yybegin(YYINITIAL);}
    .           {}
}

<PTS>{
    {Numero}    {nums.add(Integer.parseInt(yytext()));}
    {Op}      {operador = yytext();
                operar(nums, operador);
                yybegin(PTS);}
    {EndP}      {operar(nums,"*"); yybegin(YYINITIAL);}

}

. {}