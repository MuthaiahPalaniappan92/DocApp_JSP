<%-- 
    Document   : particularforum
    Created on : 30-Jul-2015, 1:14:58 PM
    Author     : c0652674
--%>

<%@page import="java.sql.ResultSet"%>
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
			<li><a href="../Project/productpost.jsp" data-toggle="tab">Existing Forum</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header> 
        <div class="chat_window">
            <%
                String u="";
                String forumName="";
                DB d=new DB();
                try{
                    u=session.getAttribute("loginUser").toString();
                    forumName=request.getParameter("forumid").toString();
                    out.println(u+forumName);
                }catch(Exception e){
                    
                }
                ResultSet rs=d.getWholeChatFromAForum(forumName);
                while(rs.next()){
                    out.println("<b>"+rs.getString("sender")+"</b>:        "+rs.getString("message")+"<br>");
                }
            %>
            
        </div>
            <form name="forum" action="forumchat" method="post">
                <div class="row form-group">
                    <div class="col-lg-4">
                        <input type="hidden" name="foumName" value="<%=forumName%>"/>
                        <input type="hidden" name="user" value="<%=session.getAttribute("loginUser")%>"/>
                        <input type="text" name="message" class="form-control" placeholder="Your Message here"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-2">
                        <input type="submit" value="Send" class="btn btn-default col-lg-6"/>
                    </div>
                </div>
            </form>
    </body>
</html>
