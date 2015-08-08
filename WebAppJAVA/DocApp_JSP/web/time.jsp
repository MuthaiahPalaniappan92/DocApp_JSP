<%-- 
    Document   : time
    Created on : 8-Aug-2015, 2:32:53 PM
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script type="text/javascript">

        </script>
    </head>
    <body>
        <div class="container">
            <header>
                <div class="navbar navbar-default">
                    <div class="navbar-header">
                        <ul class="nav nav-pills nav-justified">
                            <li><h2>Welcome to Blue water</h2></li>
                        </ul>
                    </div>
                </div>
            </header><br><br><br>
            <% String doc = request.getParameter("doc");%>
            <form action="submitServlet" method="post">
                <div class="row form-group">
                    <input type="hidden" name="patientName" value="<%=request.getParameter("PatientName")%>"/>
                    <input type="hidden" name="emailId" value="<%=request.getParameter("emailId")%>"/>
                    <input type="hidden" name="gender" value="<%=request.getParameter("gender")%>"/>
                    <input type="hidden" name="diagnosis" value="<%=request.getParameter("diagnosis")%>"/>
                    <input type="hidden" name="speciality" value="<%=request.getParameter("speciality")%>"/>
                    <input type="hidden" name="docName" value="<%=request.getParameter("doc")%>"/>
                    <input type="hidden" name="date" value="<%=request.getParameter("date")%>"/>

                    <%
                        DB_Connection d = new DB_Connection();

                        LinkedList listOfTime = d.getTime(request.getParameter("date"), doc);

                    %>
                    <div class="col-lg-4 col-lg-offset-4">                             
                        <label for="time" styleClass="control-label">Appointment Time:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <select name="time" styleClass="form-control">
                            <%                                for (int i = 0; i < listOfTime.size(); i++) {
                                    out.println("<option value='" + listOfTime.get(i) + "'>" + listOfTime.get(i) + "</option>");
                                }
                            %>
                        </select>    
                    </div><br><br><br>
                    <div class="row form-group">
                        <div class="col-lg-4 col-lg-offset-4">
                            &nbsp;&nbsp;&nbsp;&nbsp;<label for="time" styleClass="control-label">Email Alert:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" value="true" name="time"/>
                        </div>
                    </div><br><br><br>    
                    <div class="row form-group">
                        <div class="col-lg-4 col-lg-offset-4">
                            <input type="submit" style="text-align: center; font-size: 25px; margin-left: 150px;" value="NEXT" styleClass="btn btn-success"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>    
    </body>
</html>
