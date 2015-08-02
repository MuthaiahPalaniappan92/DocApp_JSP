<%-- 
    Document   : chatbox
    Created on : 18-Jun-2015, 2:05:45 PM
    Author     : c0652674
--%>


<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="Project.DB_Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Box</title>
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
        <div class="container">
            
            <div class="well">
                
                <%
                    
                        String userName="";
                    try{
                        userName=session.getAttribute("username").toString();
                        out.println("<p><b>WELCOME "+userName+"</b></p>");
                        
            //          System.out.println(d.getAllUserName().toString());
                    }catch(Exception e){
                        response.sendRedirect("login.jsp");
                    }
                %>
            </div>
            
            <script type="text/javascript">
                <%DB_Users d=new DB_Users();%>
                
                $(function() {
                    var myJSON = <%out.println(d.getAllUserName(session.getAttribute("username").toString()));%>;
                    $( "#receiver" ).autocomplete({
                        source: myJSON
                    });
                });
            </script>
            
            <form action="LoginServlet" method="POST">
                
                <div class="row form-group">
                    <div class="col-xs-1 ">
                        <label for="receiver">To :</label>
                    </div>
                    <div class="col-lg-3">
                        <input type="text" name="receiver" id="receiver" class="form-control"/>  
                        <input type="hidden" name="sender" id="sender" value="<%=userName%>"/>
                    </div>    
                </div>    
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
            <div class="error">
                <div class="well" style="color:red">${emptyReceiverOrMessage}</div>
            </div>    
                        
                    
                    <%  
                        ArrayList conversationList =d.getChatList(userName);
                        if(conversationList.size()!=0){
                            for(int i=0;i<conversationList.size();i++){
                                out.println("<p><a href='chatdisplay.jsp?opponent="+conversationList.get(i)+"' name='opponent'><input type='button' value='"+conversationList.get(i)+"' class='btn btn-lg-6 btn-default '></a>");
                            }
                        }
                        
                    %>
                           
        </div>
        
    </body>
</html>
