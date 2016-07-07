/**********************************************************************************************************************
*SearchThread é uma classe thread, que faz uma busca pública no facebook usando restfb.*******************************
***********Ela dá duas opções através da definição do parâmetro do construtor String param, em que se for "small"******
************ela irá gerar uma lista de FacebookProfile de acordo com a palavra-chave da busca, ID, Nome e Foto ********
************param = "small" pois define que vai irá baixar as imagens da foto do perfil do usuário em mais baixa*******
************resolução, para ser renderizado futuramente em uma JTable.*************************************************
***********param = "large" é utilizado para baixar as fotos na melhor resolução para a memória secúndária.*************
***********************************************************************************************************************
*/
package facebook.Model;

import com.restfb.*;
import com.restfb.exception.*;
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
    private static Connection<User> publicSearch;
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
                                                        //O start da thread sendo guiado pelo parâmetro do tamanho da foto, ler header.
    }
    public void setFlag(int flag){
                                                        //flag static da classe SearchThread para se setado, no cancelamento ou início do Search.
        cancel_flag = flag;
       
    }
    public void list_users(){                           //Faz a comunicação com o facebook para geração da lista de usuários com os dados (ID,Nome,Foto).
        
        try{
            
            publicSearch = facebookClient.fetchConnection("search", User.class, Parameter.with("q", Search), Parameter.with("type", "user"));
                                                        //publicSearch static, faz a busca dos usuários no facebook.                                                                            
            for(int i=0; i < publicSearch.getData().size();i++){
                                                        //condição para a pausa da busca.
                   
                                                        //picture é um objeto com a URL das fotos, em tamanho pequeno.
                    picture = 
                     facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", 
                     JsonObject.class, Parameter.with("redirect","false"),Parameter.with("type",param));  
                    array = picture.getJsonObject("data").getString("url"); 
                                                        // array é um String que extrai URL do objeto.
                    try {
                                                        //Buffer da foto, é extraída através da URL escrita na array, img é transformada em ícone para ico.
                        URL url = new URL(array); 
                        BufferedImage img = ImageIO.read(url);
                        ico = new javax.swing.ImageIcon(img);
                        users.add(new FacebookProfile(i+1,publicSearch.getData().get(i).getId(),publicSearch.getData().get(i).getName(),ico)); 
                        model.insert(users);
                                                        /*É adicionado um novo FaceBoookProfile (ID, Nome e Foto) na ArrayList users, model.insert() 
                                                          é invocado para inseração de mais uma linha na jTable.*/
           
                     } catch (MalformedURLException e) {
                 
                     } catch (IOException e) {
                
                } 
                     
            }
                                                        //Tratamento de Exceção quando não dado um token válido ou campo de busca vazio.
        }catch(FacebookOAuthException e){ System.out.println("Token de Acesso Inválido");} 
        catch(FacebookGraphException e){ System.out.println("Campo de busca vazio");}
        catch(FacebookNetworkException e){}
    }
    public void image_save(){
    try{
                                                                                                     
        for(int i=0; i < users.size();i++){
                                                        //picture é um objeto com a URL das fotos, em tamanho grande.
            picture = 
              facebookClient.fetchObject(publicSearch.getData().get(i).getId()+"/picture", 
               JsonObject.class, Parameter.with("redirect","false"),Parameter.with("type",param));  
            array = picture.getJsonObject("data").getString("url"); 
                                                        // array é um String que extrai URL do objeto.
            try {
                                                        //Buffer da imagem (img) a partir da url da array.
                URL url = new URL(array);                                             
                BufferedImage img = ImageIO.read(url);
                File outputfile = new File(publicSearch.getData().get(i).getId()+".png");
                ImageIO.write(img, "png", outputfile);
                                                        /*File outputfile, cria um arquivo com ID+".png", imagem (img) é escrita nesse mesmo arquivo
                                                          no formato png.*/  
           
            } catch (MalformedURLException e) {
                 
            } catch (IOException e) {
                
            } 
          
        }                                               //Tratamento de Exceção quando não dado um token válido ou campo de busca vazio.
    }catch(FacebookOAuthException e){ System.out.println("Token de Acesso Inválido");} 
        catch(FacebookGraphException e){ System.out.println("Campo de busca vazio");}
    catch(FacebookNetworkException e){}
    }
   
}
