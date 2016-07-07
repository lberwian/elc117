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
  SearchThread results;
    public Model(){
        users = new ArrayList<FacebookProfile>();
    }
    public void setToken (String token){
       this.token = token;  
       facebookClient = new DefaultFacebookClient(this.token);
       
         
    }
    public void setSearch(String Search){
  
        this.Search = Search;
        setConnection();
       
    
    }
    public void setConnection(){
        
        results = new SearchThread(Search, token,users);
        results.start();
   
                                                                                                                          
    }
    public void killConnection(){
    
        results.stop();
      
    
    }
  
}
