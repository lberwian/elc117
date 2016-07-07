/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facebook.Controll;
import facebook.Model.Model;
import facebook.View.View;
/**
 *
 * @author bbl
 */
public class Controll {
    
    
    private final Model model;
    private final View view;
    private String token;

    public Controll(View view, Model model){
        
        this.model = model;
        this.view = view;
        
    }
    public void defToken(String token){
           
        this.model.setToken(token);
        
    }
    public String getToken(){
    
        return this.token;
         
    }
    public void defSearch(String Search){
    
        this.model.setSearch(Search);
        setView();
       
    }
    public void searchControl(){
       
        this.model.killConnection();
       
    }
    public void setView(){
      
        this.view.setModel(this.model);
           
    }
    public void clear(){
        
        this.model.clear();
        setView();
        
    }
    public void setSaveImage(){
    
        this.model.save();
        
    }
    
}
