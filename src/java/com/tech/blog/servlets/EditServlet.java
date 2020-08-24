
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class EditServlet extends HttpServlet {
    
    
    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
    {
        
        PrintWriter out=res.getWriter();
       //fetch all the data
        
       String userName=req.getParameter("user_name");
       String userEmail=req.getParameter("user_email");
       String userPassword=req.getParameter("user_password");
       String userAbout=req.getParameter("user_about");
       Part part=req.getPart("image");
       String imageName=part.getSubmittedFileName();
    
       //get the user from the session
       
       HttpSession s=req.getSession();
        User user=(User) s.getAttribute("currentUser");
       user.setName(userName);
       user.setEmail(userEmail);
       user.setPassword(userPassword);
       user.setAbout(userAbout);
       String oldFile=user.getProfile();
       user.setProfile(imageName);
       
       
       //update database....
       
        UserDao userDao=new UserDao(ConnectionProvider.getConnection());
    
        boolean ans=userDao.updateUser(user);
        if(ans)
        {
           
            
            String  path=req.getRealPath("/")+"pics"+File.separator+user.getProfile();
            
            
            //delete code
            String  pathOldFile=req.getRealPath("/")+"pics"+File.separator+oldFile;
            
            if(! oldFile.equals("default.png")){
            Helper.deleteFile(pathOldFile);
            }
            if(Helper.saveFile(part.getInputStream(), path))
            {
                 Message msg=new Message("Profile details updated", "success", "alert-success");
        
                  s.setAttribute("msg",msg);
            }
            else
            {
            
              Message msg=new Message("something went wrong", "error", "alert-danger");
         
             s.setAttribute("msg",msg);
            
            }
        }
        else
        {
          
            Message msg=new Message("something went wrong", "error", "alert-danger");
         
         s.setAttribute("msg",msg);
        }
        
        res.sendRedirect("profile.jsp");
        
    }
    
}
