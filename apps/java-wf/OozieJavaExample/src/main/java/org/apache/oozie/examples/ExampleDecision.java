package org.apache.oozie.examples;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Properties;
 
public class ExampleDecision {
    public static void main (String[] args) {
       String text = args[0];
        try{
          File file = new File(System.getProperty("oozie.action.output.properties"));
          Properties props = new Properties();
 
          if (text.equals("yes")) {
                props.setProperty("key1", "value1");
                props.setProperty("key2", "value2");
          } else {
                props.setProperty("key1", "novalue");
                props.setProperty("key2", "novalue");
          }
 
          OutputStream os = new FileOutputStream(file);
          props.store(os, "");
          os.close();
          System.out.println(file.getAbsolutePath());
        }
        catch (Exception e) {
          e.printStackTrace();
        }
    }
}
