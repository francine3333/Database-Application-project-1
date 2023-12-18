<%-- 
    Document   : application_decision
    Created on : 11 21, 23, 1:02:49 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application decision</title>
    </head>
    <body>
        
        <%
    // Retrieve form data
    String applicantName = request.getParameter("applicant_name");
    String qualifications = request.getParameter("qualifications");
    String experiences = request.getParameter("experiences");
    %>
    // Set data in the achievement bean or use it to perform database operations
    // Example: A.setApplicantName(applicantName);

    // Perform any necessary processing or database operations

    // Display success or failure message
     <h2>Choose Achievement_Id to delete</h2> 
    <%
        int status;
        
        if (status == 1) {
    %>
        <h1>Application Evaluation Successful!</h1><br>
    <%
        } else {
    %>
        <h1>Application Evaluation Failed!</h1>
    <%
        }
    %>
        
        
        
    </body>
</html>
