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
        
        private int ID;
        private String NOME;
        private ImageIcon Foto;
        
        public void FacebookProfile(){}
        
        public void FacebookProfile(int ID, String NOME, ImageIcon Foto){
            this.ID = ID;
            this.NOME = NOME;
            this.Foto = Foto;
              
        }
        public int getID(){
        
            return ID;
        
        
        }
        public String getNome(){
        
            return NOME;
        
        
        }
        public ImageIcon getFoto(){
        
            return Foto;
        
        
        }
    
           
    
}
