/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facebook.Model;
import javax.swing.ImageIcon;

/**
 *
 * @author bbl
 */
public class FacebookProfile {
        
        private final String ID;
        private final String NOME;
        private final ImageIcon Foto;
        private final int row;
        
       public void FacebookProfile(){}
        
        public FacebookProfile(int row,String ID, String NOME, ImageIcon Foto){
            this.ID = ID;
            this.NOME = NOME;
            this.Foto = Foto;
            this.row = row;
              
        }
        public String getID(){
        
            return ID;
                
        }
        public String getNome(){
        
            return NOME;
                
        }
        public ImageIcon getFoto(){
        
            return Foto;
                
        }
        public int getRow(){
        
            return row;
        
        }
        
    
           
    
}
