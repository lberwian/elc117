/////////////////////////////////////T8 - ELC117/////////LEONARDO BERWIAN//////////////////////
package t8;
import java.util.*;


public class T8 {
    
    
    public static void main(String[] args) {
        
       chapa r2 = new chapa();
       r2.chapa();
       bolacha [] r1 = new bolacha[50];
       int shift_pontox=1;
       int shift_pontoy=1;
       bolacha maior=new bolacha();
       double maior1=0;
       
       for(bolacha n:r1){
           
           n=new bolacha();
           n.bolacha(shift_pontox,shift_pontoy);
           
           if(maior1<n.area()){
               maior=n;
               maior1=n.area();
           }
           
           shift_pontox++;
           if(shift_pontox==25){
               shift_pontoy=3;                             //Troca da primeira linha de bolachas para pŕoxima
               shift_pontox=1;
           
           
           }
       } 
       r2.imprime1();
       maior.imprime();
       
     
    }
    
}
