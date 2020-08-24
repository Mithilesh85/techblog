
package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
      try
      {
       
          if(con==null)
          {
          
         //load the driver
          Class.forName("com.mysql.jdbc.Driver");
         
         //creating connection
         String url="jdbc:mysql://localhost:3306/techblog";
         String user="root";
         String password="myserver";
         con=DriverManager.getConnection(url, user, password);
          }
          
      }catch(Exception e)
      {
       e.printStackTrace();
      
      }
        
    
      return con;
    }
    
}
