
package com.tech.blog.servlets;

import com.tech.blog.entities.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;


public class LogoutServlet extends HttpServlet {
    
    public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
        
        HttpSession s=req.getSession();
        s.removeAttribute("currentUser");
        Message m=new Message("Logout successfully","success","alert-success");
        s.setAttribute("msg", m);
        
        res.sendRedirect("login_page.jsp");
        
     
    
    }
    
}
