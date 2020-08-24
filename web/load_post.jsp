<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<%

  PostDao dao=new PostDao(ConnectionProvider.getConnection());
  List<Post> posts= dao.getAllPosts();
  for(Post p:posts)
  {
     %>
     
     <div class="col-md-6 mt-2">
         
         <div class="card">
             <img src="blog_pic/mk.jpg" class="card-img-top" alt="...">
             <div class="card-body">
                 <b><%=p.getpTitle()%></b>
                 <p><%=p.getpContent()%></p>
                 <pre><%=p.getpCode()%></pre>
                 
                 
             </div>
             
             
             
             
         </div>
         
         
     </div>
     
     
     
     <%
  
  
  }


%>
</div>