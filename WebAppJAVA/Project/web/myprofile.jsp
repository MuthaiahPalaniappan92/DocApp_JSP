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
        <title><%=session.getAttribute("username").toString()%></title>
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
			<li><a href="home.jsp" data-toggle="tab">Home</a></li>
                        <li class="active"><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li><a href="" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="../Project/productpost.jsp" data-toggle="tab">Contact Us</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header>
        <div class="container">
            <div class="well">
                
                <%
                    String user="";
                    try{
                        user=session.getAttribute("username").toString();
                        
                    }catch(NullPointerException e){
                        response.sendRedirect("login.jsp");
                    }
                    
                    DB_Users d=new DB_Users();
                    Users u=d.getUser(user);
                    String address=u.getAddress();
                    String city=u.getCity();
                    String oldPassword=u.getPassword();
                %>
                <h3>Welcome <%=user%>, you can update your info, if necessary</h3>
            </div>
            <form action="LoginServlet" method="post">
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="newAddress">Address</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="newAddress" class="form-control" value="<%=address%>"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="newCity">City</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="newCity" class="form-control" value="<%=city%>"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="newPassword">Password</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="newPassword" class="form-control" value="<%=oldPassword%>"/>
                        <input type="hidden" name="loginUser"  value="<%=user%>"/>
                    </div>
                </div>    
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-2">
                        <input type="submit" value="Update" class="btn btn-default col-lg-6"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
