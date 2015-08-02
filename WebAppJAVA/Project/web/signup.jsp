<%-- 
    Document   : signup
    Created on : 15-Jun-2015, 10:33:04 AM
    Author     : c0652674
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="resources/css/styles.css"  type="text/css">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="resources/js/jquery.validate.min.js"></script>
        <script src="./resources/js/myScript.js"></script>
        
        <script type="text/javascript">
           
            function validateUserName(){
                var text=document.getElementById("fName").value;
                if(text==""){
                    document.getElementById("errorFirstName").innerHTML = "Mandatory field";
                    document.getElementById("errorFirstName").style.color="red";
                }else{
                    $("#errorFirstName").html("OK");
                    $("#errorFirstName").css({color: "green"});
                }   
            }
        </script>
    </head>
    <body>
        <div >
        <header>
            <div class="navbar navbar-default">
		<div class="navbar-header">
                    <ul class="nav nav-pills nav-justified">
			<li><a href="#home" data-toggle="tab">Home</a></li>
                        <li><a href="../Project/myprofile.jsp" data-toggle="tab">My Profile</a></li>
                        <li class="active"><a href="" data-toggle="tab">Sign Up</a></li>
                        <li><a href="../Project/login.jsp" data-toggle="tab">Log In</a></li>
                        <li><a href="chatbox.jsp" data-toggle="tab">Chat Box</a></li>
			<li><a href="../Project/productpost.jsp" data-toggle="tab">Product Posting</a></li>
                        <li><a href="../Project/LoginServlet" data-toggle="tab">Log Out</a></li>
		    </ul>
                </div>
            </div>
           </header> 
            <div class="container">    
            <div class="row">
                <div class="col-lg-3">
                    <p class="well"><b>Sign Up Form</b></p>
                </div>
            </div>
            <form name="signup" id="signup" action="login.jsp" method="post">
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="firstName">First Name</label>
                        <label for="firstName" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="firstName" value="" id="fName" class="form-control" onblur="validateUserName();" placeholder="Enter your First Name"/>
                    </div> 
                    <div class="col-md-3" id="errorFirstName"></div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="lastName">Last Name</label>
                        <label for="lastName" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="lastName" class="form-control" placeholder="Enter your Last Name"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="userName">User Name</label>
                        <label for="userName" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="userName" class="form-control" placeholder="Enter your User Name"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="password">Password</label>
                        <label for="password" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="password" name="password" class="form-control" placeholder="Enter your Password"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="cpassword">Confirm Password</label>
                        <label for="cpassword" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="password" name="cpassword" class="form-control" placeholder="Re enter your Password"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="gender">Gender</label>
                        <label for="gender" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        Male <input type="radio" name="gender" value="Male" />
                        Female <input type="radio" name="gender" value="Female" />
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="email">Email</label>
                        <label for="email" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="email" class="form-control" placeholder="Enter your Email Id"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="address">Address</label>
                        <label for="address" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="address" class="form-control" placeholder="Enter your Address"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-2">
                        <label for="city">City</label>
                        <label for="city" style="color: red">*</label>
                    </div>
                    <div class="col-lg-4">
                        <input type="text" name="city" class="form-control" placeholder="Enter your City"/>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-lg-4 col-lg-offset-2">
                        <input type="submit" value="Submit" class="btn btn-default col-lg-6"/>
                    </div>
                </div>
            </form>
                
            <div class="error">
                <div class="well" style="color:red">${duplicateUserName}</div>
            </div>
        </div>
        </div>
            <%int a=5;
              String s="";
            %>
    </body>        
</html>
