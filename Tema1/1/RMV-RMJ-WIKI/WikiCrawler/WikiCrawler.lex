%%

%int

%{
    String cadena;
%}

IMAGEN = class\=\"image\"
AUDIO1 = class\=\"mwPlayerContainer\ k-player\"
AUDIO2 = class\=\"unicode\ audiolink\"
VIDEO = class\=\"PopUpMediaTransform\"
EXTENSIONIMAGEN = jpg | jpeg | png | svg | gif | JPG | JPEG | PNG | SVG | GIF
EXTENSIONVIDEO = ogv | OGV 
LINK = href\=\"[^\"\ ]*\.
DESTACADO = Featured\spictures | Commons\:Valued\simages

%%
    {IMAGEN}    {WikiCrawler.nImg++;}

    {AUDIO1} | {AUDIO2} {WikiCrawler.nAudio++;}

    {VIDEO}     {WikiCrawler.nVideo++;}

    {LINK}{EXTENSIONIMAGEN}\" {cadena = yytext().substring(6, yytext().length()-1);
                                WikiCrawler.enlacesImagenes.add(cadena);}

    {LINK}{EXTENSIONVIDEO}\" {cadena = yytext().substring(6, yytext().length()-1);
                                WikiCrawler.enlacesVideo.add(cadena);}

    {DESTACADO} {if(!WikiCrawler.enlacesDestacados.contains(cadena)){WikiCrawler.enlacesDestacados.add(cadena);}}

    [^]     {}

