
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
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
public class AddPostServlet extends HttpServlet {
    
    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
    {
          PrintWriter out=res.getWriter();
        
          
          int cid=Integer.parseInt(req.getParameter("cid"));
          String pTitle=req.getParameter("pTitle");
          String pContent=req.getParameter("pContent");
          String pCode=req.getParameter("pCode");
          Part part=req.getPart("pic");
          
          //getting current user id
          
          HttpSession session=req.getSession();
          User user=(User)session.getAttribute("currentUser");
          
          //out.println("your post title is "+pTitle);
          //out.println(part.getSubmittedFileName());
          
          Post p=new Post(pTitle, pContent, pCode,part.getSubmittedFileName(),null, cid,user.getId());
          
          PostDao dao=new PostDao(ConnectionProvider.getConnection());
          if(dao.savePost(p))
          {
          
            
               String  path=req.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
               Helper.saveFile(part.getInputStream(),path);
                out.println("done");
          }
          else
          {
              out.println("error");
          
          }
          
    
    }
    
}
