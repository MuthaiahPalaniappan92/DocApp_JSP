<%-- 
    Document   : candidate_details
    Created on : Aug 1, 2015, 9:49:14 PM
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
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <title>JSP Page</title>
        <script type="text/javascript">
            $(document).ready(function(){
               $('#doa').datepicker();
            });
        </script>
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
            <section>
                <div class="well">
                    <h2>Welcome <%=session.getAttribute("user")%></h2>
                </div>
                <form action="candidate_details" method="post">
                    <input type="hidden" value="<%=session.getAttribute("user")%>" name="username">
                    <input type="hidden" value="<%=request.getParameter("jobid")%>" name="jobid">
                    <label for="language">Language Preference</label>
                    <select name="language">
                        <option value="English">English</option>
                        <option value="French">French</option>
                        <option value="Spanish">Spanish</option>
                    </select>
                    <label for="gender">Gender</label>
                    <select name="gender" data-role="slider">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                    <label for="doa">Date of Availability</label>
                    <input type="text" data-role="date" name="doa" id="doa"/> 
                    <fieldset data-group="controlgroup">
                        <label for="position">Position</label>
                        <input type="radio" name="position" id="student" value="Student"/>
                        <label for="student">Student</label>
                        <input type="radio" name="position" id="entry" value="entry"/>
                        <label for="entry">Entry Level Programmer</label>
                        <input type="radio" name="position" id="junior" value="junior"/>
                        <label for="junior">Junior Programmer</label>
                        <input type="radio" name="position" id="senior" value="senior"/>
                        <label for="senior">Senior Programmer</label>
                    </fieldset>  
                    <fieldset data-group="controlgroup">
                        <label for="interest">Area of Interest</label>
                        <input type="checkbox" name="interest" id="FrontEndDevelopment" value="FrontEndDevelopment">
                        <label for="FrontEndDevelopment">Front End Development</label>
                        <input type="checkbox" name="interest" id="BackEndDevelopment" value="BackEndDevelopment">
                        <label for="BackEndDevelopment">Back End Development</label>
                        <input type="checkbox" name="interest" id="BI" value="BI">
                        <label for="BI">Business Intelligence</label>
                    </fieldset>
                    <fieldset data-group="controlgroup" data-type="horizontal" data-mini="true">
                        <label for="skills">Skills</label>
                        <input type="checkbox" name="skills" id=".NET"  value=".NET">
                        <label for=".NET">.NET</label>
                        <input type="checkbox" name="skills" id="JAVA" value="JAVA">
                        <label for="JAVA">JAVA</label>
                        <input type="checkbox" name="skills" id="delphi"  value="delphi">
                        <label for="delphi">Delphi</label>
                        <input type="checkbox" name="skills" id="ssms" value="ssms">
                        <label for="ssms">SQL SERVER</label>
                        <input type="checkbox" name="skills" id="ssis" value="ssis">
                        <label for="ssis">SSIS</label>
                        <input type="checkbox" name="skills" id="ssas" value="ssas">
                        <label for="ssas">SSAS</label>
                        <input type="checkbox" name="skills" id="ssrs" value="ssrs">
                        <label for="ssrs">SSRS</label>
                    </fieldset>
                    <label for="additionalSkills">Additional Skills</label>
                    <textarea name="additionalSkills"></textarea>
                    <div data-role="rangeslider">
                        <label for="rangeslider">Salary Expectation</label>
                        <input type="range" min="0" max="100000" value="20000" name="start">
                        <input type="range" min="0" max="100000" value="80000" name="end">
                    </div>
                    <input type="submit" value="Submit"/>
                </form>
            </section>
            <div data-role="footer">
                <h2>&copy;Infolife Technologies Pvt Ltd</h2>
            </div>
    </body>
</html>
