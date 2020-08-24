
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class LoginServlet extends HttpServlet{
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
    
        //fetching username and password from request
        PrintWriter out=res.getWriter();
        String userEmail=req.getParameter("email");
        String userPassword=req.getParameter("password");
        UserDao dao=new UserDao(ConnectionProvider.getConnection());
      User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
    
      
      if(u==null)
      {
        //out.println("invalid details..try again");
          
          Message msg=new Message("Invalid details ! try with another", "error", "alert-danger");
         HttpSession s=req.getSession();
         s.setAttribute("msg",msg);
         res.sendRedirect("login_page.jsp");
         
          
          
      }else
      {
      
          HttpSession s=req.getSession();
          s.setAttribute("currentUser",u);
          res.sendRedirect("profile.jsp");
          
      
      }
      
      
      
    
    }
    
}
