/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facebook.Model;
import java.util.ArrayList;
import com.restfb.*;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;
import com.restfb.types.User;
import com.restfb.types.Page;
import Main.Main;
import java.net.URL;
import java.net.*;
/**
 *
 * @author bbl
 */
public class Model {
    
  private static FacebookClient facebookClient ;
  ArrayList<FacebookProfile> users;
  private String Search;
  private String token;
    public Model(){
        users = new ArrayList<FacebookProfile>();
    }
    public void setToken (String token){
       this.token = token;  
       facebookClient = new DefaultFacebookClient(this.token);
       
       //System.out.println("User name: " + user.getName());
      
    }
    public void setSearch(String Search){
     System.out.println("User name: " + Search);
        this.Search = Search;
        setConnection();
       
    
    }
    public void setConnection(){
    User user = facebookClient.fetchObject("me", User.class);
       
                                                                                                    
    Connection<User> publicSearch =
    facebookClient.fetchConnection("search", User.class,
    Parameter.with("q", Search), Parameter.with("type", "user"));
                                                                                                    
    for(int i=0; i < publicSearch.getData().size();i++){
                                                                                                                         
    JsonObject picture = 
    facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", JsonObject.class, Parameter.with("redirect","false"));  
    String array = picture.getJsonObject("data").getString("url"); 
    
    try{
    URL url = new URL(array);
    javax.swing.ImageIcon ico = new javax.swing.ImageIcon(url);                                                                                                     
    users.add(new FacebookProfile(publicSearch.getData().get(i).getId(),publicSearch.getData().get(i).getName(),ico));                                                                                                                              // String firstPhotoUrl = picture.getJsonArray("url"); 
    
    }catch(MalformedURLException ex){}
   
          
             
             }
                                                                                                                          
    }
    
  
}
