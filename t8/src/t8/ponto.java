/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package t8;

//Classe ponto, que define pontos x,y de um plano bidimensional qualquer.
public class ponto {
    
    private int x;
    private int y;
    
    public void ponto(){
         x=y=0;
    }
    public void ponto(int _x, int _y){
        x=_x;
        y=_y;
     
    }
    public void imprime(){
          
        System.out.printf("Posição da bolacha: %d %d \n",x,y);
    }
     
}
    
    
    
    

