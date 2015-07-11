<%-- 
    Document   : adminEmailSender
    Created on : 11-Jul-2015, 4:34:54 PM
    Author     : c0652674
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Email Sender</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"></link>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"></link>
        <link rel="stylesheet" href="resources/styles.css"></link>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('.datepicker').datepicker();
            });
        </script>
    </head>
    <body>
        <form method='post' action="AlertServlet">
            <div class="row form-group">
                <div class="col-lg-4 col-lg-offset-4">
                <label for="date" styleClass="control-label">Today's Date:</label>
                <input type="text" name="date" id="datte" value="${admin.date}" styleClass="form-control datepicker"/>                            
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-4 col-lg-offset-4">
                    <input type='submit' value="NEXT" id="buttons" styleClass="btn btn-success col-lg-12 form-control"></h:commandButton>
                </div>
            </div>
        </form>
    </body>
</html>
