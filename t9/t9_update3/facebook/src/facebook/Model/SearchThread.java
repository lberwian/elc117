/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facebook.Model;
import com.restfb.*;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;
import com.restfb.types.User;
import com.restfb.types.Page;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
/**
 *
 * @author root
 */
public class SearchThread extends Thread{
    
    private FacebookClient facebookClient;
    private String Search;
    ArrayList<FacebookProfile> users;
    public SearchThread (String Search,String token,  ArrayList<FacebookProfile> users){
    
            facebookClient = new DefaultFacebookClient(token);
            this.Search = Search;
            this.users = users;
    
    
    }
    @Override
    public void run(){
        
    User user = facebookClient.fetchObject("me", User.class);
    
                                                                                                    
    Connection<User> publicSearch =
    facebookClient.fetchConnection("search", User.class,
    Parameter.with("q", Search), Parameter.with("type", "user"));
                                                                                                    
    for(int i=0; i < publicSearch.getData().size();i++){
                                                                                                                
    JsonObject picture = 
    facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", JsonObject.class, Parameter.with("redirect","false"));  
    String array = picture.getJsonObject("data").getString("url"); 
    spendSomeTime();
    try{
    URL url = new URL(array);
    javax.swing.ImageIcon ico = new javax.swing.ImageIcon(url);                                                                                                     
    users.add(new FacebookProfile(publicSearch.getData().get(i).getId(),publicSearch.getData().get(i).getName(),ico)); 
       
    
    }catch(MalformedURLException ex){}
        
    }
    }
    private void spendSomeTime() {
        for (int i = 0; i < 1000000000; i++) {
            for (int j = 0; j < 1000000000; j++) {
            }
        }
    }        
 
    
}
