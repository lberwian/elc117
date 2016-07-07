/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facebook.Model;
import java.util.ArrayList;
import com.restfb.*;
import com.restfb.types.User;
import com.restfb.types.Page;
import Main.Main;

/**
 *
 * @author bbl
 */
public class Model {
    
  private static FacebookClient facebookClient ;
  ArrayList<FacebookProfile> users;
    public Model(){
        users = new ArrayList<FacebookProfile>();
    }
    public void setToken (String Token){
         
       facebookClient = new DefaultFacebookClient(Token);
    
    }
        
    
        
    //private static FacebookClient facebookClient = new DefaultFacebookClient("EAACEdEose0cBAHme5n4YlaZA463XiGZAWitscz6d2vJHIHIAJrqKgcRNDMqaPKknx9wOfIXfLvYeHbRlQuRddwNroR1WJvO1oYpOV4BszJ1fxcWBvVSqLKYZCp0eettEs3WAx59z67xjsTvcSjKGS1ew7mVO55gyhnnncffwm2YcKogdxU0");
   /* User user = facebookClient.fetchObject("me", User.class);
    Page page = facebookClient.fetchObject("me", Page.class);
    Connection<User> publicSearch =
    facebookClient.fetchConnection("search", User.class,
    Parameter.with("q", "Adolf"), Parameter.with("type", "user"));
    System.out.println("Public search: " + publicSearch.getData().get(0).getName());
    System.out.println("User name: " + user.getName());
    System.out.println("Page likes: " + page.getLikes());
    */
    
}
