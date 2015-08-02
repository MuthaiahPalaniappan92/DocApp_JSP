<%-- 
    Document   : forgotpassword
    Created on : 21-Jul-2015, 10:20:15 PM
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
    <head>
    <body>
       
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="home.jsp" data-toggle="tab">Home</a></li>
                        <li><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li class="active"><a href="" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="../Project/productpost.jsp" data-toggle="tab">Product Posting</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
           </header> 
       <form name="forgotPassword" action="ForgotServlet" method="POST">
            
            <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="f_email">Email:</label>
                    <label for="f_email" style="color:red">*</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" id="f_email" name="f_email"/>
                </div>    
            </div> 
            </div>
           <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-sm-offset-1">
                    <label for="f_username">User Name:</label>
                    <label for="f_username" style="color:red">*</label>
                </div> 
                <div class="col-lg-4">
                    <input type="text" class="form-control" id="f_username" name="f_username"/>
                </div>    
            </div> 
            </div>
            <div class="form-group">
            </div>
            <div class="row form-group">
                <div class="col-lg-4 col-lg-offset-3">
                    <input type="submit" value="Submit" class="btn btn-default col-lg-6"/>
                </div>
            </div>
       </form>
    </body>
</html>
