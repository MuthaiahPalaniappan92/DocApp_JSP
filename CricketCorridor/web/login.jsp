<%-- 
    Document   : login
    Created on : 30-Jul-2015, 11:40:16 AM
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
                        <li><a href="signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li><a href="login.jsp" data-toggle="tab">Log In</a></li>
                        <li><a href="newforum.jsp" data-toggle="tab">New Forum</a></li>
			<li><a href="existingforum.jsp" data-toggle="tab">Existing Forum</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header> 
        <div class="container">    
            <div class="row">
                <div class="col-lg-3">
                    <p class="well"><b>Log In Form</b></p>
                </div>
            </div>
            <form name="login" id="login" action="login" method="post">
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="userName">User Name</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="userName" class="form-control" placeholder="Enter your User Name"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="password">Password</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="password" name="password" class="form-control" placeholder="Enter your Password"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-2">
                        <input type="submit" value="Submit" class="btn btn-default col-lg-6"/>
                    </div>
                </div>
            </form>
            ${invalidMessage}
        </div>    
    </body>
</html>
