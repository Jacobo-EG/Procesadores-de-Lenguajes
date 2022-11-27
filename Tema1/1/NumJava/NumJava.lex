

%%

%%
[1-9]+[0-9]*    {                                                                     
                return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());
           }
0[0-7]*   { 
                return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());
           }
0x[0-9A-Fa-f]+    { 
                return new Yytoken(Yytoken.TOKEN_CTE_ENTERO, yytext());
           }
[1-9][0-9]*(l|L)        { 
                return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());
           }
0[0-7]*(l|L)        { 
                return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());
           }
0x[1-9A-Fa-f]+(l|L)        { 
                return new Yytoken(Yytoken.TOKEN_CTE_ENTERO_LARGO, yytext());
           }
[0-9]+\.[0-9]*(E(\-|\+)?[0-9]+)?      {                                       
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());
           }
[0-9]*\.[0-9]+(E(\-|\+)?[0-9]+)?      {                                       
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());
           }  
[0-9]*(\.)?[0-9]+E(\-|\+)?[0-9]+      {                                       
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());
           }
[0-9]*(\.)?[0-9]*(f|F)      { 
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());
           }  
[0-9]*(\.)?[0-9]*E[0-9]+(f|F)      { 
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());
           } 
[0-9]*(\.)?[0-9]*E\-[0-9]+(f|F)      { 
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());
           }
[0-9]*(\.)?[0-9]*E\+[0-9]+(f|F)      { 
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_CORTO, yytext());
           }  
[0-9]+(\.)?[0-9]*(E(\-|\+)?[0-9]+)?(d|D)         { 
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());
           }
[0-9]*\.[0-9]+(E(\-|\+)?[0-9]+)?(d|D)         { 
                return new Yytoken(Yytoken.TOKEN_CTE_REAL_LARGO, yytext());
           }
[^\s]+         { 
                return new Yytoken(Yytoken.TOKEN_ERROR, yytext());
           }            
\n|\s          {} 
