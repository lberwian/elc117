/******************************************************************
Classe com as informações do perfil e foto do perfil do facebook.
*******************************************************************/
package facebook.Model;
import javax.swing.ImageIcon;


public class FacebookProfile {
        
        private final String ID;
        private final String NOME;
        private final ImageIcon Foto;
        private int row;
        
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
