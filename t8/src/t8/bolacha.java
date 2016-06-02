package t8;
import java.util.*;

class bolacha extends chapa{ //Classe das bolachas, herda a classe chapa (assadeira), aonde se identifica, a proporção 
                                //máxima que a as bolachas podem ter.
        private int formato;
        private double largura;
        private double comprimento;
        private double raio;
        private double area;
        private String [] formatoStr={"Circular","Triangular","Retângular"} ;
        ponto ponto=new ponto();
      
        void bolacha(){}//Construtor;
        void bolacha(int num,int num1){
            
            formato=gerador.nextInt(3);  //Formato aleatório de 0 a 2, 0 = retângulo, 1=triângulo e 2=círculo
            if(formato==2)
                   circular();
            
            this.largura=1 + gerador.nextInt(larguraBolacha());   //Gera altura aleatória da bolacha a ser gerada, dentro dos limites definidos pela assadeira
            this.comprimento=1 + gerador.nextInt(comprimentoBolacha()); //Gera comprimento(base) aleatório a ser gerada.
            
            if(formato==1)
                   triangulo();
            if(formato==0)
                   retangulo();
            
            ponto.ponto(((comprimentoBolacha()/2)*(num)),(larguraBolacha()/2)*(num1)); //Posição em que foi colocado a bolacha na assadeira, definido com ponto central da bolacha.
            
        }
        private void circular(){
            int aux;
            if(larguraBolacha()<comprimentoBolacha())
                aux=larguraBolacha();
            else aux=comprimentoBolacha();          //TENTATIVAS DE TORNAR MAIS COMPETITVO, CIRCULAR DIFICILMENTE PERDE
            raio=(2 + gerador.nextInt(aux/2));     //Define-se o raio de uma bolacha circular, aleatoriamente.
            area=Math.PI * Math.pow(raio, 2.0);   //Cálculo da área do círculo
        
        }
        private void triangulo(){
            
            area=(this.largura*this.comprimento)/2; //Área do triângulo
        
        }
        private void retangulo(){ //Área do retângulo
            
            area=this.largura*this.comprimento;
                   
        }
        public double area(){
              
           return area;
       
        }
        public void imprime()
        {
           ponto.imprime();
           System.out.printf("Formato %s\nMaior Bolacha: %2f\n", formatoStr[formato],area);
           
       
        }
    }


    

