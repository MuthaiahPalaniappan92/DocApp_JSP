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
        <title>Conversation with <%=request.getParameter("opponent")%></title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
        <script src="./resources/js/myScript.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".text_Box").scroll();
        });
        </script>
    </head>
    <body>
       
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="home.jsp" data-toggle="tab">Home</a></li>
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
            
               <!-- <h3 class="col-lg-4 col-sm-offset-5">Conversation with <%=request.getParameter("opponent")%></h3>-->
           
                <div class="text_Box">
                <%
                    while(rs.next()){
                        if(rs.getString("sender").equals(userName)){
                            if(rs.getString("dateupdated").equals("0")){
                                %><div style='text-align:right;'>sent Today</div>
                                <div style='color: green; text-align:right;'><%=rs.getString("message")%></div>
                            <%}else{%>
                                <div style='text-align:right;'><b>sent <%=rs.getString("dateupdated")%> day(s) before</div>
                                <div class='leftAlign' style='color: green;text-align:right;'><%=rs.getString("message")%></div>
                            <%}
                        }else{
                            if(rs.getString("dateupdated").equals("0")){%>
                                <div style='text-align:left'><b>sent Today</div>
                                <div class='rightAlign' style='color: red; text-align:left;'><%=rs.getString("message")%></div>
                            <%}else{%>
                                <div style='text-align:left'><b>sent at <%=rs.getString("dateupdated")%>  day(s) before</div>
                                <div style='color: red; text-align:left;'><%=rs.getString("message")%></div>
                            <%}
                        }
                    }
                    %>
            </div>
            
            <form action="ChatServlet" method="POST" class="chat">
                
                
                        <input type="hidden" name="receiver" id="receiver" value="<%=opponent%>"/>  
                        <input type="hidden" name="sender" id="sender" value="<%=userName%>"/>
                    
                <div class="row form-group">
                    <div class="col-lg-5 col-sm-offset-2 topPadding">
                        <input type="text" name="message" class="form-control" id="message" placeholder="Enter your message here"/>
                    </div>    
                </div>   
                <div class="row form-group">
                    <div class="col-lg-2 col-sm-offset-1">
                        <label for="message"></label>
                    </div>
                    <div class="col-lg-2 col-sm-offset-1">
                        <input type="submit" value="Send" class="btn btn-md-3 btn-success"/>
                    </div>    
                </div>   
                
            </form>
    </body>
</html>
