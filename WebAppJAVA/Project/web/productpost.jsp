<%-- 
    Document   : productpost
    Created on : 8-Jul-2015, 3:58:48 PM
    Author     : c0652674
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
        <script src="./resources/js/myScript.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#fileName').focus(function(){
                    alert('Please give the file name with extension. Sorry for the inconvenience. I am a beginner');
                })
            })
        </script>
    </head>
    <body>
       
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="#home" data-toggle="tab">Home</a></li>
                        <li><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li><a href="" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li  class="active"><a href="../Project/productpost.jsp" data-toggle="tab">Product Posting</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header>
        <div class="well">
                
                <%
                    
                        String u="";
                    try{
                        u=session.getAttribute("username").toString();
                        out.println("<p><b>WELCOME "+u+"</b></p>");
                        
            //          System.out.println(d.getAllUserName().toString());
                    }catch(Exception e){
                        response.sendRedirect("login.jsp");
                    }
                %>
            </div>
        <form name="login" action="FileUploadServlet" method="POST" enctype="multipart/form-data">            
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="category">Category:</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" id="category" name="category"/>
                </div>    
            </div> 
            </div>
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="keywords">Keyword:</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" name="keywords"/>
                </div>    
            </div>
            </div>
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="cost">Cost:</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" name="cost"/>
                    <input type="hidden" class="form-control" name="user" value="<%=u%>"/>
                </div>    
            </div>
            </div>
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="fileName">File Name with Extension</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" name="fileName" id="fileName"/>
                </div>    
            </div>
            </div>
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="image">Image:</label>
                </div> 
                <div class="col-lg-4">
                    <input type="file" class="form-control" name="imagess"/>
                </div>    
            </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-4 col-lg-offset-3">
                    <input type="submit" value="Submit" class="btn btn-default col-lg-6"/>
                </div>
            </div>
            
        </form>    
    </body>
</html>
