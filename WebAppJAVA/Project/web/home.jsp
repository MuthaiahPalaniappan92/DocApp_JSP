<%-- 
    Document   : home
    Created on : 2-Aug-2015, 7:13:10 PM
    Author     : c0652674
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Project.DB_Users"%>
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
        <style>
            img{
                width:42px;
                height: 42px;
            }
        </style>
    </head>
    <body>
       
        <header>
        
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li  class="active"><a href="" data-toggle="tab">Home</a></li>
                        <li><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li><a href="../Project/signup.jsp" data-toggle="tab">Sign Up</a></li>
                        <li><a href="" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li ><a href="../Project/productpost.jsp" data-toggle="tab">Product Posting</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
        </header>
        <%
            String img="";
            DB_Users d=new DB_Users();
            ResultSet r=d.displayProducts();
            
            out.println("<table>");
            out.println("<tr><td>Category</td><td>Images</td><td>Cost</td><td>Posted By</td></tr>");
            while(r.next()){
                img=r.getString("images");
                out.print("<tr><td>"+r.getString("category")+"</td>");
                out.print("<td><img src='"+img+"'></td>");
                out.print("<td>"+r.getString("cost")+"</td>");
                out.println("<td><a href='chatdisplay.jsp?opponent="+r.getString("user")+"'>"+r.getString("user")+"</a></td></tr>");
            }
            out.println("</table>");
        %>
    </body>
</html>
