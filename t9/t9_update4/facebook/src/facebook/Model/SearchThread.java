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


/**
 *
 * @author root
 */
public class SearchThread extends Thread{
    private Model model;
    private FacebookClient facebookClient;
    private String Search;
    ArrayList<FacebookProfile> users;
    javax.swing.ImageIcon ico;
  
    public SearchThread (String Search,String token,  ArrayList<FacebookProfile> users,Model model){
    
            facebookClient = new DefaultFacebookClient(token);
            this.Search = Search;
            this.users = users;
            this.model = model;
    
    }
    @Override
    public void run(){
        
    User user = facebookClient.fetchObject("me", User.class);
    Connection<User> publicSearch = facebookClient.fetchConnection("search", User.class, Parameter.with("q", Search), Parameter.with("type", "user"));
                                                                                                    
    for(int i=0; i < publicSearch.getData().size();i++){
                                                                                                                
        JsonObject picture = 
        facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", JsonObject.class, Parameter.with("redirect","false"));  
        String array = picture.getJsonObject("data").getString("url"); 
   
    
        try{
        URL url = new URL(array);
        BufferedImage img = ImageIO.read(url);
        ico = new javax.swing.ImageIcon(img);
        users.add(new FacebookProfile(i+1,publicSearch.getData().get(i).getId(),publicSearch.getData().get(i).getName(),ico)); 
        model.insert(users);
         
     } catch (MalformedURLException e) {
                  e.printStackTrace();
               } catch (IOException e) {
                  e.printStackTrace();
               } 
    }
    
    }
   
    
}
