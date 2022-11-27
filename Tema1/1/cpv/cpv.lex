

%%

%%
[a-zA-Z]*[aeiouAEIOU][aeiouAEIOU]([a-zA-Z]*[aeiouAEIOU])?    { 
                return new Yytoken(Yytoken.A, "0");
           }
[a-zA-Z]*[AEIOU][AEIOU][A-Z]*[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]         { 
                return new Yytoken(Yytoken.C, "0");
           }  
[a-zA-Z]*[aeiouAEIOU]         { 
                return new Yytoken(Yytoken.B, "0");
           }  
[a-zA-Z]*[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]         { 
                return new Yytoken(Yytoken.D, "0");
           }
\n         { 
                return new Yytoken(Yytoken.EOLN, "0");
           } 
.          {} 
