////////////////////////////////////////////////////////////////////////////////
//////////////////////////////Model do MVC//////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////O model é construído a partir da lista de usuários//////////////////
/////////////criado pela busca na thread SearchThread///////////////////////////
////////////////////////////////////////////////////////////////////////////////

package facebook.Model;
import java.util.ArrayList;
import com.restfb.*;
import javax.swing.table.AbstractTableModel;
import javax.swing.*;

public class Model extends AbstractTableModel {
    
  private static FacebookClient facebookClient ;
  private ArrayList<FacebookProfile> users;
  private String Search;
  private String token;
  private SearchThread results;
  private SearchThread saves;
  private static final String[] columnNames = {"#", "Picture", "ID", "Nome"};
  

    public Model(){
        
        users = new ArrayList<>();
        
        
    }
    public void setToken (String token){
        
        this.token = token;  
                 
    }
    public void setSearch(String Search){
  
        this.Search = Search;
        setConnection();
       
    }
    public void setConnection(){
                            //As duas threads construídas, results para criação de tabela na view, e saves para salvamento de imagens no disco.
        this.results = new SearchThread(Search, token,users,this,"small");
        this.saves = new SearchThread(Search, token,users,this,"large");
        this.results.setFlag(0);
        this.results.start();
                            //Thread results iniciada para gerar a array <FacebookProfile> users.                          
    }
    public void killConnection(){
        
        if(this.results!=null){
                        //Fim da thread de busca.
            this.results.setFlag(1);
            this.results.stop();
              
        }
    }
    public void insert(ArrayList users){
                            //Aumento do tamanho da tabela em linhas.
        this.users = users;
        fireTableRowsInserted(this.users.size(),this.users.size());
       
    }
    public void clear (){
                            //Todas as linhas da tabela são removidas e a array users liberada.
        fireTableRowsDeleted(this.users.size(),this.users.size());
        killConnection();    
        this.users.clear();
      
       
    }
    public void save(){
                            /*Condição para o uso impróprio do botão Search e .isAlive(), 
                              para impedir de tentar iniciar uma thread saves enquanto outra já está ocorrendo.*/      
        if(saves!=null) {
           
           if(saves.isAlive()) return; 
           saves.start();
                            //Thread saves iniciada para salvamento de fotos no disco.
       }
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
