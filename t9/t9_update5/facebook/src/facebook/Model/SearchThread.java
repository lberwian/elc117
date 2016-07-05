/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

/**
 *
 * @author root
 */
public class SearchThread extends Thread{
    
    private static int cancel_flag=0;
    private final Model model;
    private final FacebookClient facebookClient;
    User user;
    private final String Search;
    ArrayList<FacebookProfile> users;
    javax.swing.ImageIcon ico;
    Connection<User> publicSearch;
    JsonObject picture;
    String array;
    String param;
    
    public SearchThread (String Search,String token,  ArrayList<FacebookProfile> users,Model model){
    
            facebookClient = new DefaultFacebookClient(token);
            this.Search = Search;
            this.users = users;
            this.model = model;
            param ="small";  
    
    }
    @Override
    public void run(){
      
        image();
    
    }
    public void setFlag(int flag){
    
        cancel_flag = flag;
       
    }
   
    public void image(){
    
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
            if(param.equals("small")){
                
                 ico = new javax.swing.ImageIcon(img);
                 users.add(new FacebookProfile(i+1,publicSearch.getData().get(i).getId(),publicSearch.getData().get(i).getName(),ico)); 
                 model.insert(users);
                 
                         
            
            }
            else{
                
            if(i==users.size())break;
            File outputfile = new File(publicSearch.getData().get(i).getId()+".png");
            ImageIO.write(img, "png", outputfile);}
            
           
            } catch (MalformedURLException e) {
                 
            } catch (IOException e) {
                
            } 
            
          
    }
    
    }
    public void image_save(){
            cancel_flag=0;
            param="large";
            image();
    
    
    }
}
