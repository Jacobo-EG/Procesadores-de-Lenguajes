%%

%int

%%

(\"[^\"]+".jpg\""\s"class=\"image\"")|(\"[^\"]+".JPG\""\s"class=\"image\"")   {WikiCrawler.nImg++; WikiCrawler.enlacesImagenes.add("https://commons.wikimedia.org"+yytext());}
(\"[^\"]+".jpeg"\"\s"class=\"image\"")|(\"[^\"]+".JPEG"\"\s"class=\"image\"")   {WikiCrawler.nImg++;WikiCrawler.enlacesImagenes.add("https://commons.wikimedia.org"+yytext());}
(\"[^\"]+".png"\"\s"class=\"image\"")|(\"[^\"]+".PNG"\"\s"class=\"image\"")   {WikiCrawler.nImg++; WikiCrawler.enlacesImagenes.add("https://commons.wikimedia.org"+yytext());}
(\"[^\"]+".svg"\"\s"class=\"image\"")|(\"[^\"]+".SVG"\"\s"class=\"image\"")  {WikiCrawler.nImg++; WikiCrawler.enlacesImagenes.add("https://commons.wikimedia.org"+yytext());}
(\"[^\"]+.gif\"(\s)class=\"image\")|(\"[^\"]+.GIF\"(\s)class=\"image\")   {WikiCrawler.nImg++; WikiCrawler.enlacesImagenes.add("https://commons.wikimedia.org"+yytext());}

(href=\"[^\"]+.ogv\")|(href=\"[^\"]+.OGV\")      {WikiCrawler.nVideo++; WikiCrawler.enlacesVideo.add("htpps://upload.wikimedia.org"+yytext());}  

"<audio".+"><\/audio>"          {WikiCrawler.nAudio++;}

[^]                               { }