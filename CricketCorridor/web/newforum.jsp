<%-- 
    Document   : newforum
    Created on : 30-Jul-2015, 12:43:36 PM
    Author     : c0652674
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    </head>
    <body>
        <header>
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="#home" data-toggle="tab">Home</a></li>
                        <li><a href="" data-toggle="tab">Sign Up</a></li>
                        <li><a href="login.jsp" data-toggle="tab">Log In</a></li>
                        <li><a href="newforum.jsp" data-toggle="tab">New Forum</a></li>
			<li><a href="existingforum.jsp" data-toggle="tab">Existing Forum</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header> 
        <div class="container">  
            <div class="well">
                <h3>Welcome <%=session.getAttribute("loginUser")%></h3>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <p class="well"><b>Creating New Forum</b></p>
                </div>
            </div>
            <form name="forum" action="createforum" method="post">
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="forumName">Forum Name</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="forumName" class="form-control" placeholder="Forum Name"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="description">Description</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="description" class="form-control" placeholder="Description here"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-2">
                        <input type="submit" value="Submit" class="btn btn-default col-lg-6"/>
                    </div>
                </div>
            </form>
            ${invalidMessage}
    </body>
</html>
