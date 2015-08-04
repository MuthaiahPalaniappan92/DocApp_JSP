<%-- 
    Document   : existingforum
    Created on : 30-Jul-2015, 9:01:51 PM
    Author     : c0652674
--%>

<%@page import="java.util.Map"%>
<%@page import="CrickerCorridor.DB"%>
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
         
            <%  DB db=new DB();
            Map<String,String> map=db.listOfFoum();
            for(Map.Entry entry:map.entrySet()){
                out.println("<a href='particularforum.jsp?forumid="+entry.getKey().toString()+"'>"+entry.getValue().toString()+"</a>");
            }
            %>
    </body>
</html>
