%%

%%
[a-zA-Z]*[aeiouAEIOU][aeiouAEIOU]([a-zA-Z]*[aeiouAEIOU])?   {return(new Yytoken(Yytoken.A,1));}
[a-zA-Z]*[aeiouAEIOU][aeiouAEIOU][a-zA-Z]*[b-df-hj-np-tv-xz]   {return(new Yytoken(Yytoken.B,1));}
[a-zA-Z]*[aeiouAEIOU]   {return(new Yytoken(Yytoken.C,1));}
[a-zA-Z]+   {return(new Yytoken(Yytoken.D,1));}
\n          {return(new Yytoken(Yytoken.EOLN,1));}
[^]         { }