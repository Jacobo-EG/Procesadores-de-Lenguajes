
%%

%int

Variable = [a-zA-Z_][a-zA-Z_0-9]*

%{

    String variable = "";
    String valor = ""; 

%}

%xstate VARIABLE STRING PRINT

%%

<YYINITIAL> {

    {Variable}\=            { 
                              variable = yytext().substring(0, yylength()-1); 
                              yybegin(VARIABLE);
                            }

    echo                    { System.out.print(yytext()); yybegin(PRINT); }

    [a-zA-Z]+               { System.out.print(yytext() + " "); }

    \${Variable}            { System.out.print(TablaSimbolos.get(yytext()) + " "); }                      

    [^] {}
}

<PRINT> {

  

  [^$\n]+           { System.out.print(yytext()); }

  \${Variable}      {   
                      System.out.print(TablaSimbolos.get(yytext()));
                    }

  \n                { yybegin(YYINITIAL); }

  [^] {}
}

<VARIABLE> {

    \"                      { yybegin(STRING); }    

    \${Variable}            {   
                              valor += TablaSimbolos.get(yytext());
                            }

    [a-zA-Z0-9]+\\;         {
                              valor += yytext();  
                            }

    [a-zA-Z0-9=*+]+         {                    
                              valor += yytext();         
                            }

    ;|\n                    { 
                              TablaSimbolos.put(variable, valor);  
                              variable = "";
                              valor = "";
                              yybegin(YYINITIAL); 
                            }

    [^] {}
}

<STRING> {

    \${Variable}    {
                      valor += TablaSimbolos.get(yytext());
                    }

    " "              { valor += yytext(); }

    [^$\n]+["\"""\$"]+[^$\n]+\"     {
                                      valor += yytext().substring(0, yylength()-1);
                                      TablaSimbolos.put(variable, valor);
                                      variable = "";
                                      valor = "";
                                      yybegin(YYINITIAL);
                                    }

    [^$\n]+\"        {
                      valor += yytext().substring(0, yylength()-1);
                      TablaSimbolos.put(variable, valor);
                      variable = "";
                      valor = "";
                      yybegin(YYINITIAL);
                    }

    [^] {}
}



