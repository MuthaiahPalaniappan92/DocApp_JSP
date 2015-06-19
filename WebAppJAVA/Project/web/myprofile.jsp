<%-- 
    Document   : myprofile
    Created on : 15-Jun-2015, 4:27:39 PM
    Author     : c0652674
--%>

<%@page import="Project.Users"%>
<%@page import="Project.DB_Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Name</title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
        <script src="resources/js/additional-methods.min.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
        <script src="resources/jquery-ui/jquery.ui.js"></script>
    </head>
    <body>
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="#home" data-toggle="tab">Home</a></li>
                        <li class="active"><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li><a href="" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="#contact" data-toggle="tab">Contact Us</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="well">
                
                <%
                    
                    String user=session.getAttribute("username").toString();
                    if(!(user.isEmpty())){
                        
                        out.println(user);
                    }else{
                        out.println("<h3 style='color:red'>Please Log in</h3>");
                    }
                    
                %>
            </div>
        </div>
    </body>
</html>
