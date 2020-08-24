
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;


@MultipartConfig
public class RegisterServlet extends HttpServlet{
    
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
    
        //fetching all the data from the  register page
            PrintWriter out=res.getWriter();
            String check=req.getParameter("check");
            if(check==null)
            {
               out.println("please check the terms and condition box");
            }
            else
            {
               //rest of the data.....
                
                String name=req.getParameter("user_name");
                String email=req.getParameter("user_email");
                String password=req.getParameter("user_password");
                String gender=req.getParameter("gender");
                String about=req.getParameter("about");
                 
                //create User object and set all data to that object
                
                User user=new User(name,email,password,gender,about);



                //creating userdao object
                UserDao dao=new UserDao(ConnectionProvider.getConnection());
                if(dao.saveUser(user))
                {
                   out.println("done");
                }
                else
                {
                   out.println("error");
                }
                
            
            }
           
            
            
            
          
    }
    
    
}
