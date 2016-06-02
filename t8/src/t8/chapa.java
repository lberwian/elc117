
package t8;
import java.util.*;

    //Classe que define as dimensões da assadeira que delimita as posições das bolachas e os limites para aleatoriedade das dimensões das bolachas.
    //A classe ponto define a posição central (x,y) dentro das dimensões permitidas pela dimensão da assadeira, divididas entre 50 possíveis posições. 
    //Duas linhas de bolachas, duas linhas de bolacha.
    class chapa{
      static Random gerador = new Random();
      private static final int comprimento=4 + gerador.nextInt(10000);
      private static final int largura=1 + gerador.nextInt(comprimento/2);
      private static final int larguraBolacha=largura/2;
      private static final int comprimentoBolacha=comprimento/25;//-1 impede de que ahaja sobreposição de bolachas.
   
      void chapa(){}
      
       public static int comprimentoBolacha(){
           
          return comprimentoBolacha;
       }   
       public static int larguraBolacha(){
         
           return larguraBolacha;
       
       }
       public static void imprime1(){
           
           System.out.printf("OBS:A posição da bolacha é a posição central dentro do espaço dentre os 50 espaços da assadeira, em 2 duas fileiras(linhas) de bolachas.\nComprimento da assadeira: %d\nLargura da assadeira: %d\n",comprimento,largura);
       }
        
    }