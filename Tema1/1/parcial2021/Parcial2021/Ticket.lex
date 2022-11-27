import java.util.List;
import java.util.ArrayList;

%%

%int

%{
    static int numItemsDistintos = 0;
    static int numItems = 0;
    static float totalCompra = 0;
    
    public static void addItemsDistintos(int x) {
    	numItemsDistintos += x;
    } 
       
    public static void addItems(int x) {
    	numItems += x;
    }
    
    public static void addCompra(float precio) {
        totalCompra += precio;	
    }

    public static void sout() {
    	System.out.println("Items distintos: " + numItemsDistintos);
    	System.out.println("Numero de items: " + numItems);
    	System.out.printf("Total de compra: %.2f", totalCompra);
    }

    List<String> productos = new ArrayList<String>();

    String productoActual = "";

    float descuento = 0;

    int unidades = 1;

    float precio= 0;

    public void addProduct(float descuento, int unidades, float precio, String producto) {

        addItems(unidades);

        addCompra(unidades*(precio - (descuento/100)*precio));

        if(!productos.contains(producto)) {
            addItemsDistintos(1);
        }
        productos.add(producto);

    }

    public void reset() {
        productoActual = "";
        descuento = 0;
        unidades = 1;
        precio = 0;
    }
%}

%xstate NOMBRE DESCUENTO UNIDADES PRECIO

%%

<YYINITIAL> {
    ^\-(\t)+   {yybegin(NOMBRE);}
    ^\-        {yybegin(NOMBRE);}
    [^]         { }
}

<NOMBRE> {
    [a-zA-Z\s]+      {productoActual = yytext(); yybegin(DESCUENTO);}
    [^]         { }
}

<DESCUENTO> {
    ([0-9]|[1-9][0-9]|100)%  {descuento = Float.parseFloat(yytext()); yybegin(UNIDADES);}
    [^]     {yybegin(UNIDADES);}
}

<UNIDADES> {
    [1-9][0-9]*uds   {unidades = (Integer.parseInt(yytext())); yybegin(PRECIO);}
    (\t)+                 {yybegin(PRECIO);}
    [^]                   {yybegin(PRECIO);}
}

<PRECIO> {
    [0-9]+(\.[0-9])?$     {addProduct(descuento, unidades, Float.parseFloat(yytext()), productoActual); yybegin(YYINITIAL);}
    E[0-9]+(\.[0-9])?$    {addProduct(descuento, unidades, Float.parseFloat(yytext()), productoActual); yybegin(YYINITIAL);}
    [0-9]+(\.[0-9])?E$    {addProduct(descuento, unidades, Float.parseFloat(yytext()), productoActual); yybegin(YYINITIAL);}
    [^]                   { }
}