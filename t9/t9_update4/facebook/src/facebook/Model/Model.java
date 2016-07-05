/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facebook.Model;
import java.util.ArrayList;
import com.restfb.*;
import javax.swing.table.AbstractTableModel;

import javax.swing.*;

/**
 *
 * @author bbl
 */
public class Model extends AbstractTableModel {
    
  private static FacebookClient facebookClient ;
  ArrayList<FacebookProfile> users;
  private String Search;
  private String token;
  SearchThread results;
  private static final String[] columnNames = {"#", "Picture", "ID", "Nome"};

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
        
        results = new SearchThread(Search, token,users,this);
        results.start();
                                                                                                                             
    }
    public void killConnection(){
           
        results.stop();
    
    }
    public void insert(ArrayList users){
        
        this.users = users;
            fireTableRowsInserted(this.users.size(),this.users.size());
       
    }
    @Override
      public Class getColumnClass (int columnIndex) {
       if (columnIndex == 1) return ImageIcon.class; 
       return Object.class;
    }
      @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public String getColumnName(int columnIndex) {
        return columnNames[columnIndex];
    }

    @Override
    public int getRowCount() {
        return users.size();
    }

     @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch(columnIndex) {
            case 0: return users.get(rowIndex).getRow();
            case 1: return users.get(rowIndex).getFoto();
            case 2: return users.get(rowIndex).getID();
            case 3: return users.get(rowIndex).getNome();
        }
        return null;
    }
  
}
