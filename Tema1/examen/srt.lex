%%

%int

%xstate TIEMPO1H TIEMPO1M TIEMPO1S TIEMPO2H TIEMPO2M TIEMPO2S LINEA

%%

<YYINITIAL> {
    ^[0-9]+$  {srt.numSub++; yybegin(TIEMPO1H);}
    [^]     { }
}

<TIEMPO1H> {
    [0-9][0-9]/":"  {srt.seg -= Integer.parseInt(yytext())*(3600); yybegin(TIEMPO1M);}
    ":"             { }
    [^]     {yybegin(YYINITIAL); }
}

<TIEMPO1M> {
    [0-9][0-9]/":"  {srt.seg -= (Integer.parseInt(yytext())*60); yybegin(TIEMPO1S);}
    [^]*":"[^]*             { }
    [^] {yybegin(YYINITIAL);}
}

<TIEMPO1S> {
    [0-9][0-9]/(","[0-9][0-9][0-9])  {srt.seg -= Integer.parseInt(yytext());}
    ":"                                 { }
    (","[0-9][0-9][0-9])                { }
    " --> "           {yybegin(TIEMPO2H);}
    [^]     { yybegin(YYINITIAL);}
}

<TIEMPO2H> {
    [0-9][0-9]/":"  {srt.seg += Integer.parseInt(yytext())*3600; yybegin(TIEMPO2M);}
    ":"             { }
    [^]     { }
}

<TIEMPO2M> {
    [0-9][0-9]/":"  {srt.seg += Integer.parseInt(yytext())*60; yybegin(TIEMPO2S);}
    ":"             { }
    [^]     { }
}

<TIEMPO2S> {
    [0-9][0-9]/(","[0-9][0-9][0-9])  {srt.seg += Integer.parseInt(yytext());}
    ":"                                 { }
    (","[0-9][0-9][0-9])             { }
    \n              {yybegin(LINEA);}
    [^]     { yybegin(YYINITIAL); }
}

<LINEA>     {
    [^\s\t]+$   {srt.numLineas++; srt.numPalabras++;}
    [^\s\t]+     {srt.numPalabras++;}
    ^(\n)        {yybegin(YYINITIAL);}
    [^]           { }
}