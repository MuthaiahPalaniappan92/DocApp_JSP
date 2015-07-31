<%-- 
    Document   : forgotpassword
    Created on : 19-Jul-2015, 2:20:14 PM
    Author     : c0652674
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
        <div data-role="page" id="home">
            <header data-role="header">
                <img id="logo" src="infolife-logo.png">
                <h1 id="cName">Infolife Technologies Pvt Ltd</h1>
                <h2>Bone to Health care</h2>
                <div data-role="navbar">
                    <ul>
                        <li><a href="" data-theme="a" data-icon="home" data-transition="pop">Home</a></li>
                        <li><a href="clientdetails.jsp" data-theme="f" data-icon="star" data-transition="pop">Client Details</a></li>
                        <li><a href="products.jsp" data-theme="c" data-icon="grid" data-transition="pop">Products</a></li>
                        <li><a href="contact.jsp" data-theme="d" data-icon="location" data-transition="pop">Contact Us</a></li>
                        <li><a href="careers.jsp" class="ui-btn-active" data-theme="e" data-icon="comment" data-transition="pop">Careers</a></li>
                    </ul>
                </div>
            </header>
            <section data-role="content">
                <p><b>Enter your Email id and user Name</b></p>
                <form action="mainservlet" method="post">
                    <label for="forgotmailid">Email</label>
                    <input type="email" name="forgotmailid"/>
                    <label for="forgotusername">User Name</label>
                    <input type="text" name="forgotusername"/>
                    <input type="submit" data-role="button" value="Find Password" data-transition="flip" data-icon="arrow-r" />
                </form>
            </section>
            <div data-role="footer">
                <h2>&copy;Infolife Technologies Pvt Ltd</h2>
            </div>
        </div>
    </body>
</html>
