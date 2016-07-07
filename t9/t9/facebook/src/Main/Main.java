/**************************************************************************************************************
/////////////////////Paradigmas de Programação - ELC117 - T9///////////////////////////////////////////////////
/////////////////////////Professora: Andrea Charão/////////////////////////////////////////////////////////////
//////////////////////////Aluno: Leonardo Berwian//////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
*O trabalho segue o padrão MVC, com Model, View e Controll.
* Essa ferramenta consegue gerar uma lista de IDs, Nomes e Fotos de perfis do Facebook.
* Lista é gerada através da restfb, pela uma busca pública no facebook.
* É necessário um token de acesso (campo Token) para ter autorização do uso da Graph API Explorer, então
** o usuário entra com uma palavra-chave para busca (campo Search) dos perfis, e o botão Search faz a busca 
** e ocorre listagem na tabela.
* É possível cancelar(Cancel) a busca ou começar uma nova busca (Search). 
* Para salvar as fotos dos perfis em disco rígido, uso do botão Save é utilizado, podendo fazer isso 
**simultaneamente enquanto faz busca e listagem.
* O fim do salvamento só ocorre após o cancelamento da busca ou o fim dela, salvando assim até a foto do último
** perfil listado.
***************************************************************************************************************


*/
package Main;

import facebook.View.View;

/**
 *
 * @author bbl
 */
public class Main {
    public static void main(String args[]) {
       
            new View().setVisible(true);
                  
   }
    
}
