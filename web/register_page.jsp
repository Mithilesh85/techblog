

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register_page</title>
        
         <!--css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        
    </head>
    <body class="primary-background">
           <!--navbar-->
       
       <%@include file="normal_navbar.jsp" %>
        
        
        <main class=" primary-background" style="height: 70vh;padding-bottom: 100px">
            
            <div class="container">
            
            <div class="col-md-6 offset-md-3">
                
                <div class="card">
                   
                    <div class="card-header primary-background text-white text-center">
                        
                        <p>Register Here</p>  
                        
                        <span class=" fa fa-user-plus fa-3x"></span>
                        <br>
                        
                    </div>
                    <div class="card-body" >
                        
                        <form  id="reg-form"  action="user" method="post">
                            <div class="form-group">
    <label for="user_name">User Name</label>
    <input  name="user_name"type="text" class="form-control" id="user_name" placeholder="enter name">
  
  </div>
                            
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                            
                            
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password"  type="password" class="form-control" id="password"placeholder="enter password" >
  </div>
                            
                            
    <div class="form-group">
    <label for="exampleInputPassword1">Select Gender</label>
    <br>
    <input type="radio"  id="gender" name="gender" value="Male">Male
    <input type="radio"  id="gender" name="gender" value="Female">Female
  </div>
     
                            <div class="form-group">
                                
                                
                                <textarea name="about" class="form-control" id="" rows="5" placeholder="enter something about yourself"></textarea>
                                
                                
                                
                            </div>
                                
                            
                            
                            
                            
  <div class="form-group form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
  </div>
        <br>                    
        <div class="container text-center" id="loader" style="display: none">
             <span class="fa fa-refresh fa-spin fa-4x"></span> 
             <h4>please wait..</h4>
            
        </div>  
        
  <button id="submit-btn"  type="submit" class="btn btn-primary">Sign Up</button>

                        
                        </form>
                        
                        
                    </div>                    
                    
                    
                    
                </div>
                
                
                
            </div>
            
            
            
        </div>
        
            
            
            
            
            
        </main>
        
        
        
        
        
        
        
         <!--javascript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="js/myjs.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    
    <script>
        
        $(document).ready(function(){
            
            console.log("loaded.........");
            
            $('#reg-form').on('submit',function(event){
               
            event.preventDefault();
            
            let form=new FormData(this);
            
            $("#submit-btn").hide();
            $("#loader").show(); 
            
            // send register servlet
            
            $.ajax({
                
               url:"user",
               type:'post',
               data:form,
               success: function (data, textStatus, jqXHR) {
                      
                   console.log(data);
                   
                     $("#submit-btn").show();
                     $("#loader").hide(); 
                     
                     
                     swal("registered succesfully. we are redirecting to login page..")
                     .then((value) => {
                      window.location="login_page.jsp";
                      

                   });
                     
                     
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                      
                     swal("something went wrong..");
                     
                    },
                    
                 processData: false,
                 contentType: false
                
                
            });
            
                
           
    
    
    
    });
            
            
    });
        
        
        
        
    </script>
    
    
    
    </body>
</html>
