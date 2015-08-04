<%-- 
    Document   : jobpost
    Created on : Aug 1, 2015, 11:26:24 PM
    Author     : Muthu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <title>JSP Page</title>
        <style>
            #logo{
                padding:10px;
                float:left;
                height:150px;
            }
            #cName{
                padding-top:50px;
                padding-bottom: 3px;
                font-size: 200%;
            }
        </style>
    </head>
    <body>
        <div data-role="page" id="home"data-title="Careers">
            <header data-role="header">
                <img id="logo" src="infolife-logo.png">
                <h1 id="cName">Infolife Technologies Pvt Ltd</h1>
                <h2>Bone to Health care</h2>
                <div data-role="navbar" class="nav-glyphish-example">
                    <ul>
                        <li><a href="index.jsp" data-theme="a"  data-icon="home" data-transition="pop">Home</a></li>
                        <li><a href="clientdetails.jsp" data-theme="f" data-icon="star" data-transition="pop">Client Details</a></li>
                        <li><a href="products.jsp" data-theme="c" data-icon="grid" data-transition="pop">Products</a></li>
                        <li><a href="contact.jsp" data-theme="d" data-icon="location" data-transition="pop">Contact Us</a></li>
                        <li><a href="careers.jsp" data-theme="e" class="ui-btn-active" data-icon="comment" data-transition="pop">Careers</a></li>
                    </ul>
                </div>
            </header>
            <form action="jobpost" method="post">
                <label for="jobTitle"><b>Job Title</b></label>
                <input type="text" name="jobTitle"/>
                <label for="expRequired"><b>Experience Required</b></label>
                <input type="number" name="expRequired"/>
                <label for="requirements"><b>Requirements</b></label>
                <textarea name="requirements">
                    
                </textarea>
                <label for="resposbilities"><b>Responsibilities</b></label>
                <textarea name="resposbilities">
                    
                </textarea>
                <input type="submit" value="Post"/>
            </form>
    </body>
</html>
