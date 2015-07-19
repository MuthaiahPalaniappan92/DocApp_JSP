<%-- 
    Document   : chatdisplay
    Created on : 19-Jul-2015, 3:53:58 PM
    Author     : c0652674
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Project.DB_Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
        <script src="./resources/js/myScript.js"></script>
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
                        <li class="active"><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="../Project/productpost.jsp" data-toggle="tab">Product Posting</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
           </header>
        ${emptyReceiverOrMessage}
        <%
            DB_Users d=new DB_Users();
            String opponent=request.getParameter("opponent");
            String userName=session.getAttribute("username").toString();
            ResultSet rs=d.getParticularConversation(opponent, userName);
            %>
            <div class="text_Box">
                <%
                    while(rs.next()){
                        if(rs.getString("sender").equals(userName) || rs.getString("receiver").equals(userName)){
                            out.println("<div  style='text-align: left'> <b>You</b> sent at "+rs.getString("dateupdated")+"</div>");
                            out.println("<div class='messages' style='text-align: left'>"+rs.getString("message")+"</div>");
                        }else{
                            out.println("<div  style='text-align: right'><b>"+ opponent +"</b> sent at "+rs.getString("dateupdated")+"</div>");
                            out.println("<div class='messages' style='text-align: right'>"+rs.getString("message")+"</div>");
                        }
                    }
                    %>
            </div>
            <form action="ChatServlet" method="POST" class="chat">
                
                
                        <input type="hidden" name="receiver" id="receiver" value="<%=opponent%>"/>  
                        <input type="hidden" name="sender" id="sender" value="<%=userName%>"/>
                    
                <div class="row form-group">
                    <div class="col-xs-1 col-sm-1">
                        <label for="message"></label>
                    </div>
                    <div class="col-lg-3">
                        <input type="text" name="message" class="form-control" id="message" placeholder="Enter your message here"/>
                    </div>    
                </div>   
                <div class="row form-group">
                    <div class="col-lg-2 col-sm-1">
                        <label for="message"></label>
                    </div>
                    <div class="col-lg-3">
                        <input type="submit" value="Send" class="btn btn-md-3 btn-success"/>
                    </div>    
                </div>   
                
            </form>
    </body>
</html>
