<%-- 
    Document   : success
    Created on : 8-Aug-2015, 4:30:45 PM
    Author     : c0652674
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="text-align: center">

        <%
            out.println("<h3>Appointment Date:" + session.getAttribute("date") + "</h3>");
            out.println("<h3>Patient Name:" + session.getAttribute("ptName") + "</h3>");
            out.println("<h3>Gender:" + session.getAttribute("sex") + "</h3>");
            out.println("<h3>Diagnosis:" + session.getAttribute("diagnosis") + "</h3>");
            out.println("<h3>Speciality:" + session.getAttribute("speciality") + "</h3>");
            out.println("<h3>Email Id:" + session.getAttribute("emailId") + "</h3>");
            out.println("<h3>Doctor Name:" + session.getAttribute("docName") + "</h3>");
            out.println("<h3>Appointment Time:" + session.getAttribute("time") + "</h3>");
        %>            
        You will get an alert Email on <%=session.getAttribute("date")%> Morning 09:00 A.M

        <h3><a href="index.jsp">Do you want to make another appointment</a></h3>
        <a href="adminEmailSender.jsp">Only For Admin, To send alert email</a>
    </body>
</html>
