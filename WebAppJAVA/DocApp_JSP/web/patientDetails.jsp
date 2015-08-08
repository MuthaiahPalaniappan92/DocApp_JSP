<%-- 
    Document   : patientDetails
    Created on : 7-Aug-2015, 11:06:15 PM
    Author     : c0652674
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="com.project.DB_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></link>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"></link>
        <link rel="stylesheet" href="resources/styles.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="container">
                    <div class="navbar navbar-default">
                        <div class="navbar-header">
                            <ul class="nav nav-pills nav-justified">
                                <li><h2  style="text-align: center">Welcome to Blue water</h2></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>

            <form action="doctor.jsp" method="post">
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-4">
                        <label for="PatientName" styleClass="control-label">Patient Name:</label>
                        &nbsp;&nbsp;&nbsp;<input type="text" value="" name="PatientName" styleClass="form-control"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-4">
                        <label for="emailId" styleClass="control-label">Email Id:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input value="" name="emailId" styleClass="form-control"/>
                    </div>
                </div>
                <div class="row-group">
                    <div class="col-lg-4 col-lg-offset-4">
                        <label for="gender" styleClass="control-label">Gender</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="male" name="gender">Male
                        <input type="radio" value="female" name="gender">Female                                
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-4">
                        <label for="diagnosis" styleClass="control-label">Diagnosis</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="diagnosis" styleClass="form-control">
                    </div>
                </div>
                <div class="row form-group">
                    <%
                        DB_Connection d = new DB_Connection();
                        LinkedList doc = d.getSpeciality();
                    %>
                    <div class="col-lg-4 col-lg-offset-4">
                        <label for="speciality" styleClass="control-label">Speciality</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <select name="speciality" styleClass="form-control">
                            <%
                                for (int i = 0; i < doc.size(); i++) {
                                    out.println("<option value='" + doc.get(i) + "'>" + doc.get(i) + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>    
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-4">
                        <input type="submit" style="text-align: center; font-size: 25px; margin-left: 150px;" value="NEXT" styleClass="btn btn-success"/>
                    </div>
                </div>
            </form>
        </div>          
    </body>
</html>
