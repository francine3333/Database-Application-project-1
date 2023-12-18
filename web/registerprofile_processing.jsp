<%-- 
    Document   : registerprofile_processing
    Created on : 11 20, 23, 1:29:14 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Faculty Process</title> <!-- Corrected closing tag for the title -->
    </head>
    <body>
        <form action="profile_menu.jsp" method="post">
            <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
            <%
                String lastName = request.getParameter("last_name");
                String firstName = request.getParameter("first_name");
                String gender = request.getParameter("gender");
                String departmentName = request.getParameter("department_name");
                String positionName = request.getParameter("position_name");
                String dateOfBirth = request.getParameter("date_of_birth");
                String mobileNumber = request.getParameter("mobile_number");
                String eligibility = request.getParameter("is_eligible");

                S.last_name = lastName;
                S.first_name = firstName;
                S.gender = gender;
                S.department_name = departmentName;
                S.position_name = positionName;
                S.date_of_birth = dateOfBirth;
                S.mobile_number = mobileNumber;
                S.is_eligible = eligibility;

            if (lastName == null || lastName.isEmpty() || firstName == null || firstName.isEmpty() || gender == null || gender.isEmpty() 
                    || departmentName == null || departmentName.isEmpty() || positionName == null || positionName.isEmpty() || dateOfBirth == null || dateOfBirth.isEmpty()
                    || mobileNumber == null || mobileNumber.isEmpty() || eligibility == null || eligibility.isEmpty()) {
        %>
            <h1>Registering Faculty Profile Failed!</h1>
        <%
            } else {
                int status = S.insertProfile(lastName, firstName, gender, departmentName, positionName, dateOfBirth, mobileNumber, eligibility);

                if (status == 1) {
        %>
            <h1>Registering Faculty Profile Successful!</h1><br>
        <% 
                } else { 
        %>
            <h1>Registering Faculty Profile Failed!</h1>
        <% 
                }
            }
        %>

        <input type="submit" value="Return to Menu">
    </form>
</body>
</html>
</html>

