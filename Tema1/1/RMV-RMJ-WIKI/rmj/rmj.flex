%%

%int

%{
    String cadena = "";
    String variable = "";
    String valor = "";
    Boolean asignacion = true;
%}

%xstate METODO VARIABLE PRINT IGUAL

%%

<YYINITIAL> {

    class                   { System.out.print(yytext()); }

    [a-zA-Z_][a-zA-Z_0-9]*  { System.out.print(" " + yytext() + "_rmj "); }


    "{"                     { 
                                System.out.println(yytext());
                                yybegin(METODO);
                            }      

    [^] {}

}

<METODO> {

    .*"{"                                       { System.out.println(yytext()); }

    String                                      { yybegin(VARIABLE); }

    [a-zA-Z_][a-zA-Z_0-9]*                      { 
                                                  variable = yytext(); 
                                                  asignacion = false; 
                                                  yybegin(IGUAL); 
                                                }

    [\t ]*System.out.println[ \t]*"("[ \t]*     { 
                                                  System.out.print(yytext() + "\"");
                                                  yybegin(PRINT);
                                                }

    [\t ]*System.out.print[ \t]*"("[ \t]*       { 
                                                  System.out.print(yytext() + "\"");
                                                  yybegin(PRINT);
                                                }

    [\t]*"}"                                    { System.out.println(yytext()); }     

    [^] {}

}

<VARIABLE> {

    [a-zA-Z_][a-zA-Z_0-9]*      {   
                                    if(asignacion){
                                        variable = yytext(); 
                                        asignacion = false;
                                    }else{
                                        valor += TablaSimbolos.get(yytext());
                                    } 
                                }

    \"[^\"]*\"                  { valor += yytext().substring(1, yytext().length()-1); }  

    ;                           { 
                                    TablaSimbolos.put(variable, valor);
                                    variable = "";
                                    valor = "";
                                    asignacion = true;
                                    yybegin(METODO);
                                }

    [^] {}
}

<IGUAL> {

    [a-zA-Z_][a-zA-Z_0-9]*              {   
                                            if(asignacion){
                                                variable = yytext(); 
                                                asignacion = false;
                                            }else{
                                                valor += TablaSimbolos.get(yytext());
                                            } 
                                        }

    \"["\n""\t""\"""\\"]*[^+]*\"        { valor += yytext().substring(1, yytext().length()-1); }

    \"[^\"]*\"                          { valor += yytext().substring(1, yytext().length()-1); }  

    ;                                   { 
                                            TablaSimbolos.put(variable, valor);
                                            variable = "";
                                            valor = "";
                                            asignacion = true;
                                            yybegin(METODO);
                                        }


    [^]  {}
}

<PRINT> {

    [a-zA-Z_][a-zA-Z_0-9]*              { cadena += TablaSimbolos.get(yytext()); }

    ");"                                {
                                            System.out.println(cadena + "\"" + yytext());
                                            cadena = "";
                                            yybegin(METODO);
                                        }

    \+                                  {}

    \"["\n""\t""\"""\\"]*[^+]*\"        { cadena += yytext().substring(1, yytext().length()-1); }

    \"[^\"]*\"                          { cadena += yytext().substring(1, yytext().length()-1); }

    [^] {}
}