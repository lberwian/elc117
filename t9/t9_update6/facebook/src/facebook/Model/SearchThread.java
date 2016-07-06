/**********************************************************************************************************************
*SearchThread é uma classe thread, que faz uma busca pública no facebook usando restAPI.*******************************
***********Ela dá duas opções através da definição do parâmetro do construtor String param, em que se for "small"******
************ela irá gerar uma lista de FacebookProfile de acordo com a palavra-chave da busca, ID, Nome e Foto ********
************param = "small" pois define que vai irá baixar as imagens da foto do perfil do usuário em mais baixa*******
************resolução, para ser renderizado futuramente em uma JTable.*************************************************
***********param = "large" é utilizado para baixar as fotos na melhor resolução para a memória secúndária.*************
***********************************************************************************************************************
*/
package facebook.Model;

import com.restfb.*;
import com.restfb.json.JsonObject;
import com.restfb.types.User;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.IOException;
import java.io.File;

public class SearchThread extends Thread{
    
    private static int cancel_flag=0;
    private final Model model;
    private final FacebookClient facebookClient;
    private User user;
    private final String Search;
    private final ArrayList<FacebookProfile> users;
    private javax.swing.ImageIcon ico;
    private Connection<User> publicSearch;
    private JsonObject picture;
    private String array;
    private final String param;
    
    public SearchThread (String Search,String token,  ArrayList<FacebookProfile> users,Model model,String param){
    
            facebookClient = new DefaultFacebookClient(token);
            this.Search = Search;
            this.users = users;
            this.model = model;
            this.param = param;  
    
    }
    @Override
    public void run(){
      
       if(this.param.equals("small")) list_users();
       else image_save();
    
    }
    public void setFlag(int flag){
    
        cancel_flag = flag;
       
    }
    public void list_users(){
    
    user = facebookClient.fetchObject("me", User.class);
    publicSearch = facebookClient.fetchConnection("search", User.class, Parameter.with("q", Search), Parameter.with("type", "user"));
                                                                                                    
        for(int i=0; i < publicSearch.getData().size();i++){
        
            if(cancel_flag==1) break;     
        
                picture = 
                 facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", 
                 JsonObject.class, Parameter.with("redirect","false"),Parameter.with("type",param));  
                array = picture.getJsonObject("data").getString("url"); 
       
                try {
            
                   URL url = new URL(array);
                   BufferedImage img = ImageIO.read(url);
                   ico = new javax.swing.ImageIcon(img);
                   users.add(new FacebookProfile(i+1,publicSearch.getData().get(i).getId(),publicSearch.getData().get(i).getName(),ico)); 
                   model.insert(users);
       
           
                } catch (MalformedURLException e) {
                 
                } catch (IOException e) {
                
                } 
        }
    }
    public void image_save(){
    
    user = facebookClient.fetchObject("me", User.class);
    publicSearch = facebookClient.fetchConnection("search", User.class, Parameter.with("q", Search), Parameter.with("type", "user"));
                                                                                                    
        for(int i=0; i < users.size();i++){
              
            picture = 
              facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", 
               JsonObject.class, Parameter.with("redirect","false"),Parameter.with("type",param));  
            array = picture.getJsonObject("data").getString("url"); 
       
            try {
            
                URL url = new URL(array);
                BufferedImage img = ImageIO.read(url);
                File outputfile = new File(publicSearch.getData().get(i).getId()+".png");
                ImageIO.write(img, "png", outputfile);
            
           
            } catch (MalformedURLException e) {
                 
            } catch (IOException e) {
                
            } 
          
        }
    
    }
}
