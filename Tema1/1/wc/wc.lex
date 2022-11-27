

%%

%int

%%
[^\s]+ { 
                return 1;
           }
. { 
                return 2;
           }  
\n     { 
                return 3;
           }  
.          {} 
