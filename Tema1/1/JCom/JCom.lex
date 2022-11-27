%%

%int

%xstate T1 T2 T3 CAD

%%

<YYINITIAL> {
    \".*\"   {}
    "//"     {yybegin(T1);}
    "/*"     {yybegin(T2);}
    "/**"    {yybegin(T3);}
    \"      {yybegin(CAD);}
    [^]      { }
}

<T1> {
    [^\n\t\s]   {JCom.tipo1++;}
    \n          {yybegin(YYINITIAL);}
    [^]         { }
}

<T2> {
    [^\n\t\s]  {JCom.tipo2++;}
    "*/"        {yybegin(YYINITIAL);}
    [^]           { }
}

<T3> {
    [^\n\t\s]  {JCom.tipo3++;}
    "*/"       {yybegin(YYINITIAL);}
    [^]        { }
}

<CAD> {
    \"        {yybegin(YYINITIAL);}
    [^]        { }
}

.               { }