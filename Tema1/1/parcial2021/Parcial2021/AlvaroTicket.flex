import java.util.List;
import java.util.ArrayList;

%%

%int

%{

    // Creo todas las variables en la que almacenaremos datos durante todo el ticket

    static int numItemsDistintos = 0;
    static int numItems = 0;
    static float totalCompra = 0;

    // Metodos para incrementar dichas variables
    
    public static void addItemsDistintos(int x) {
    	numItemsDistintos += x;
    } 
       
    public static void addItems(int x) {
    	numItems += x;
    }
    
    public static void addCompra(float precio) {
        totalCompra += precio;	
    }

    // Metodo para imprimir, obligatorio segun el .java

    public static void sout() {
    	System.out.println("Items distintos: " + numItemsDistintos);
    	System.out.println("Numero de items: " + numItems);
    	System.out.printf("Total de compra: %.2f", totalCompra);
    }

    // Lista para ver que los productos están o no repetidos
    List<String> productos = new ArrayList<String>();

    // Variable para guardar los datos del producto actual
    String productoActual = "";

    float descuento = 0;

    int unidades = 1;

    float precio= 0;

    // Añadimos el producto que toca llamando a los métodos anteriores
    public void addProduct(float descuento, int unidades, float precio, String producto) {

        addItems(unidades);

        addCompra(unidades*(precio - (descuento/100)*precio));

        // Si el producto ya estaba en la lista no lo contamos como distinto
        if(!productos.contains(producto)) {
            addItemsDistintos(1);
        }
        // Añadimos el producto a la lista
        productos.add(producto);

    }

    // Reseteamos las variables para el siguiente producto
    public void reset() {
        productoActual = "";
        descuento = 0;
        unidades = 1;
        precio = 0;
    }

%}

%xstate PRODUCTO DATOS
%%

<YYINITIAL> {

    -               {yybegin(PRODUCTO);}

    \n              {}

    [^]             {}
}

<PRODUCTO> {

    [a-zA-Z ]+  {   productoActual = yytext();
                    yybegin(DATOS);
                }
    
    [^]     {}
}

<DATOS> {

    ([0-9]|[1-9][0-9]|100)%     {   descuento = Float.parseFloat(yytext().substring(0, yytext().length()-1));   }

    [0-9]+uds                   {   unidades = Integer.parseInt(yytext().substring(0, yytext().length()-3));    }

    [0-9]+(\.?)[0-9]*           {   precio = Float.parseFloat(yytext());                                        }

    E[0-9]+(\.?)[0-9]*          {   precio = Float.parseFloat(yytext().substring(1, yytext().length()));        }

    [0-9]+(\.?)[0-9]*E          {   precio = Float.parseFloat(yytext().substring(0, yytext().length()-1));      }


    \n                          {   
                                    addProduct(descuento, unidades, precio, productoActual);
                                    reset();
                                    yybegin(YYINITIAL);
                                }

    [^]         {}
}
