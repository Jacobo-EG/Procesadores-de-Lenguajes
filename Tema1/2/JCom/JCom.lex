%%

%int

%xstate LINEA COM COM2

%%

<YYINITIAL> {
    \".*\"  { }
    "//"    { yybegin(LINEA);}
    "/*"    { yybegin(COM); }
    "/**"  { yybegin(COM2); }
    [^]     { }
}

<LINEA> {
    [^\s\t\n] { JCom.tipo1++;}
    \n      { yybegin(YYINITIAL);}
    [^]     { }
}

<COM> {
    [^\s\t\n] {JCom.tipo2++;}
    "*/"      { yybegin(YYINITIAL);}
    [^]       { }
}

<COM2> {
    [^\s\t\n] {JCom.tipo3++;}
    "*/"      { yybegin(YYINITIAL);}
    [^]       { }
}