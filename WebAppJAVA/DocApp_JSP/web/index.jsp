<%-- 
    Document   : index
    Created on : 7-Aug-2015, 10:41:53 PM
    Author     : c0652674
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></link>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"></link>
        <link rel="stylesheet" href="resources/styles.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <header>
                <div class="container">
                    <div class="navbar navbar-default">
                        <div class="navbar-header">
                            <ul class="nav nav-pills nav-justified">
                                <li><h2 style="text-align: center">Welcome to Blue water</h2></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
        </div>   <br><br><br><br><br>
        <div class="container">
            <h2 style="text-align: center">Make an Appointment, Find a Doctor, by Speciality </h2>
        </div> 
        <br><br><br><br><br>
        <div class="container">
                <h:form>
                    <div class="row form-group">
                        <div class="col-lg-4 col-lg-offset-4">
                            <a href="patientDetails.jsp" id="buttons" style="text-align: center; font-size: 50px; margin-left: 150px;" styleClass="btn btn-success col-lg-12 form-control">Start</a>
                        </div>
                    </div>    
                </h:form>
            </div> 
    </body>
</html>
