/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package facebook.Model;
import java.awt.Component;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.JLabel;
import javax.swing.*;
/**
 *
 * @author root
 */
public class ImagePictureRender extends DefaultTableCellRenderer{
    
    JLabel label = new JLabel();
     ImageIcon icon = new ImageIcon("WWW.YTS.TO.jpg");
    
@Override
 public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected,
      boolean hasFocus, int row, int column) {
    //label.setText((String) value);
    label.setIcon(icon);
    return label;
  
    }

    
}
