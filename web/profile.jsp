<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp"%>
<%

  User user=(User)session.getAttribute("currentUser");
  if(user==null)
  {
      response.sendRedirect("login_page.jsp");
      
  }



%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
          <!--css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
  
    </head>
    <body>
       
     <!--navbar-->
     
     
     
      <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>  LeanCode With Mithilesh<span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square-o"></span>  Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure </a>
        </div>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>   Contacts</a>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>   Add Post</a>
      </li>
      
        
    </ul>
    
      <ul class="navbar-nav mr-right">
          
           <li class="nav-item">
           <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span>  <%=user.getName()%></a>
           </li>
          
           <li class="nav-item">
           <a class="nav-link" href="logout"><span class="fa fa-user-plus"></span>Logout</a>
           </li>
          
      </ul>
      
      
      
      
  </div>
</nav>
     
     
      <!--navbar end-->
      
      
      <%
                               
                             Message m=(Message) session.getAttribute("msg");
                             if(m!=null)
                             {
                             %>
                                 
                                 
                                  <div class="alert <%=m.getCssClass()%>" role="alert">
                                      <%=m.getContent()%>
                                 </div>
                                 
                                 <%
                                 session.removeAttribute("msg");
                                        
                             }
                            
                            
                            
                            %>
      
      
                            
     <!-- main body of the page-->                    
                            
     <main>
         
         <div class="container">
             <div class="row mt-4">
                  <!-- first col--> 
                  <div class="col-md-4">
                      
                     <!--categories-->   
                      
                     <div class="list-group">
                      <a href="#" class="list-group-item list-group-item-action active">
                      All posts
                       </a>
                         <!--categories-->
                         <%
                         
                         PostDao d=new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list1= d.getAllCategories();
                        for(Category cc:list1)
                        {
                         
                         %>
                         
                         <a href="#" class="list-group-item list-group-item-action"><%=cc.getName()%></a>
                         
                         <%  
                        
                        }
                         
                         
                         
                         
                         %>
                         
                         
                         
                          
                       </div>
                     
                     
                      
                      
                  </div>
                   <!--second col--> 
                   <div class="col-md-8">
                       
                      <!--posts-->  
                      
                      <div class="container text-center" id="loader">
                          <i class="fa fa-refresh fa-4x fa-spin"></i>
                          <h3 class="mt-2">loading...</h3>
                          
                          
                          
                      </div>
                      
                      <div class="container-fluid" id="post-container">
                          
                          
                          
                      </div>
                       
                       
                   </div>
                 
                 
                 
             </div>
             
             
             
             
         </div>
         
         
         
         
     </main>                   
                            
                            
                            
      <!--end of main body of the page--> 
     
      <!--modal start-->
      
    

<!-- Modal -->

<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
          <div class="container text-center">
              
              <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 150px">
                   
              
              <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
              
              <!--details-->
              
              <div id="profile-details">
              <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%=user.getId()%></td>
      
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%=user.getEmail()%></td>
     
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%=user.getGender()%></td>
      
    </tr>
    <tr>
      <th scope="row">Status :</th>
      <td><%=user.getAbout()%></td>
      
      
    </tr>
    <tr>
      <th scope="row">Register Date :</th>
      <td><%=user.getDateTime().toString()%></td>
      
      
    </tr>
  </tbody>
</table>
              </div>
      
        <!--profile edit-->
        <div id="profile-edit" style="display:none">
            
            <h3 class="mt-3">Please Edit Carefully</h3>
            
            <form action="edit" method="post" enctype="multipart/form-data">
                
                <table class="table">
                    
                    <tr>
                        <td>ID :</td>
                        <td><%=user.getId()%></td>
                        
                        
                        
                    </tr>
                    <tr>
                        <td>Name :</td>
                        <td>
                            <input type="text" class="form-control" name="user_name" value="<%=user.getName()%>">
                        </td>
                        
                      </tr>
                    <tr>
                        <td>Email:</td>
                        <td>
                            <input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>">
                        </td>
                        
                      </tr>
                    <tr>
                        <td>Password:</td>
                        <td>
                            <input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>">
                        </td>
                        
                      </tr>
                    <tr>
                        <td>Gender :</td>
                        <td>
                            <%=user.getGender().toUpperCase()%>
                        </td>
                        
                      </tr>
                    <tr>
                        <td>About :</td>
                        <td>
                            <textarea rows="3" class="form-control" name="user_about"> <%=user.getAbout()%>

                            </textarea>
                            
                        </td>
                        
                      </tr>
                    <tr>
                        <td>New Pic:</td>
                        <td>
                            <input type="file" name="image" class="form-control">
                            
                        </td>
                        
                      </tr>
                    
                    
                </table>
                
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                                
                                
                            </div>
                
            </form>
            
        </div>
              
              
          </div>
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
      
      
      
      
      <!--modal end-->
      
      
        <!--add post modal start-->
        
  

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">enter your post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select Category---</option>
                     
                      <%
                      
                       PostDao pd=new PostDao(ConnectionProvider.getConnection());
                       ArrayList<Category> list= pd.getAllCategories();
                       for(Category c:list)
                       {
                       %>
                      
                       <option value="<%=c.getCid()%>"><%=c.getName()%></option> 
                       
                       
                       
                     <%
                      
                         }
                     %>
                      
                  </select>
                  
                  
              </div>
              
              
              
              <div class="form-group">
                  <input name="pTitle" type="text" class="form-control" placeholder="enter post title">
                  
              </div>  
              
              <div class="form-group">
                  
                  <textarea name="pContent" class="form-control" style="height: 200px" placeholder="enter your content"></textarea>
                  
                </div>
              <div class="form-group">
                  
                  <textarea name="pCode" class="form-control" style="height: 200px" placeholder="enter your program(if any)"></textarea>
                  
                </div >
              
                <div class="form-group">
                    <label>select your pic</lable>
                    <br>
                  <input type="file" name="pic">
                  
                  
                  
              </div>
              
                <div class="container text-center">
                    
                    
                    <button type="submit" class="btn btn-outline-primary">Post</button> 
                    
                </div>
              
          </form>
        
        
        
      </div>
      
    </div>
  </div>
</div>
        
        
        
        
        
         <!--add post modal end-->
      
      
      
      
      
        
      <!--javascript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
       
    <script>
        $(document).ready(function(){
             let editStatus=false;
           
        $('#edit-profile-button').click(function(){
                  
           if(editStatus==false)
           {
               
                $("#profile-details").hide();
                $("#profile-edit").show();
                editStatus=true;
                $(this).text("Back");
           }
           else
           {
               
                $("#profile-details").show();
                $("#profile-edit").hide();
                editStatus=false;
                $(this).text("Edit");
               
           }
             
               
                
            });
            
            
            
        });
        
        
        
        
    </script>    
    
    <!--now add post java script-->
    
    <script>
        
        $(document).ready(function(e){
           
          $("#add-post-form").on("submit",function(event){
             //this code will be called when form is submitted
             
             event.preventDefault();
             console.log("you have clicked on submit btn");
             
             let form=new FormData(this);
             
             // now requesting to server
             
             $.ajax({
                 
                 url:"AddPostServlet",
                 type:"post",
                 data:form,
                 success: function (data, textStatus, jqXHR) {
                        
                        console.log(data);
                        
                        if(data.trim()==="done")
                        {
                            
                            swal("Good job!", "saved successfully", "success");
                        }
                        else
                            
                            
        {
            
            swal("error", "something went wrong", "error");
        }
                    },
                    
                    
                 error: function (jqXHR, textStatus, errorThrown) {
                        
                          swal("error", "something went wrong", "error");
                        
                        
                    },
                    
                 processData: false,
                 contentType: false
                 
                 
                 
             });
              
              
              
          });
            
        });
        
        
        
    </script>
    
    <script>
        
        $(document).ready(function (e) {
            
            $.ajax({
                
               url:"load_post.jsp",
               success: function (data, textStatus, jqXHR) {
                        
                        console.log(data);
                        
                        $("#loader").hide();
                        $("#post-container").html(data);
                        
                        
                    }
                
                
            });
            
        });
        
        
        
    </script>
    
    
    
    
    
    </body>
</html>
