<%-- 
    Document   : registerapplication_processing
    Created on : 11 21, 23, 4:08:23 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="L_application_decision.jsp" method="post">
            <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
            <%
                String lastName = request.getParameter("last_name");
                String firstName = request.getParameter("first_name");
                String gender = request.getParameter("gender");
                String positionName = request.getParameter("position_name");
                String applicationDate = request.getParameter("application_date");
                String Qualifications = request.getParameter("qualifications");
                String dateOfBirth = request.getParameter("date_of_birth");
                String mobileNumber = request.getParameter("mobile_number");
                String Experiences = request.getParameter("experiences");
                int Recom_faculty_id = Integer.parseInt(request.getParameter("recom_faculty_id"));
                
                J.last_name = lastName;
                J.first_name = firstName;
                J.gender = gender;
                J.position_name = positionName;
                J.application_date = applicationDate;
                J.qualifications = Qualifications;
                J.date_of_birth = dateOfBirth;
                J.mobile_number = mobileNumber;
                J.experiences = Experiences;
                J.recom_faculty_id = Recom_faculty_id;
                int status = J.insertApplication(lastName, firstName, gender, positionName, applicationDate, Qualifications, dateOfBirth, mobileNumber, Experiences, Recom_faculty_id);
                
             
            if (lastName == null || lastName.isEmpty() || firstName == null || firstName.isEmpty() || gender == null || gender.isEmpty() || firstName == null || firstName.isEmpty()|| firstName == null || firstName.isEmpty()      ) {
        %>
            <h1>Registering Faculty Application Failed!</h1>
        <%
            } else {
               
                if (status == 1) {
        %>
            <h1>Registering Faculty Application Successful!</h1><br>
        <% 
                } else { 
        %>
            <h1>Registering Faculty Application Failed!</h1>
        <% 
                }
            }
        %>

        <input type="submit" value="Return to Menu">
    </form>
    </body>
</html>
