
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories()
    {
       ArrayList<Category> list=new ArrayList<>();
       
        try {
            
            String query="select * from categories";
            Statement st=this.con.createStatement();
            ResultSet set=st.executeQuery(query);
            
            while(set.next())
            {
               int cid=set.getInt("cid");
               String name=set.getString("name");
               String description=set.getString("description");
               Category c=new Category(cid, name, description);
               list.add(c);
            
            }
            
            
            
        } catch (Exception e) {
         e.printStackTrace();
        }
       
       
       
    
      return list;
    }
    
    public boolean savePost(Post p)
    {
      boolean f=false;
    
        try {
            
         String query="insert into posts(pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)"; 
         PreparedStatement  pstmt=con.prepareStatement(query);
         pstmt.setString(1,p.getpTitle());
         pstmt.setString(2,p.getpContent());
         pstmt.setString(3,p.getpCode());
         pstmt.setString(4,p.getpPic());
         pstmt.setInt(5,p.getCatId());
         pstmt.setInt(6,p.getUserId());
        
         pstmt.executeUpdate();
         f=true;
            
        } catch (Exception e) {
        e.printStackTrace();
        }
  
      
        return f;
    }
    
    
    
    //get all the post
    
    public List<Post> getAllPosts()
    {
      
      List<Post> list=new ArrayList<>();
      
      // fetch all the post
      
        try {
           
            String query="select * from posts order by pid desc";
            PreparedStatement pstmt=con.prepareStatement(query);
            ResultSet set=pstmt.executeQuery();
            
            while(set.next())
            {
              int pid=set.getInt("pID");
              String pTitle=set.getString("pTitle");
              String pContent=set.getString("pContent");
              String pCode=set.getString("pCode");
              String pPic=set.getString("pPic");
              Timestamp  date=set.getTimestamp("pDate");
              int catid=set.getInt("CatId");
              int userid=set.getInt("userId");
              
              Post post=new Post(pid,pTitle, pContent, pCode, pPic, date, catid, userid);
              list.add(post);
              
            
            
            }
            
            
            
        } catch (Exception e) {
        
          e.printStackTrace();
        
        }
       return list;
    }
    
    
    public List<Post> getPostByCatId( int CatId)
    {
       List<Post> list=new ArrayList<>();
      
      // fetch all the post by id
      
      
      
        try {
           
            String query="select * from posts where catId=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1,CatId);
            ResultSet set=pstmt.executeQuery();
            
            while(set.next())
            {
              int pid=set.getInt("pID");
              String pTitle=set.getString("pTitle");
              String pContent=set.getString("pContent");
              String pCode=set.getString("pCode");
              String pPic=set.getString("pPic");
              Timestamp  date=set.getTimestamp("pDate");
              int catid=set.getInt("CatId");
              int userid=set.getInt("userId");
              
              Post post=new Post(pid,pTitle, pContent, pCode, pPic, date, catid, userid);
              list.add(post);
              
            
            
            }
            
            
            
        } catch (Exception e) {
        
          e.printStackTrace();
        
        }
      
      
       return list;
    
    
    }
    
}
