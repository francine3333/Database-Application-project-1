<%-- 
    Document   : profile_modify_process
    Created on : 11 20, 23, 1:18:56 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Profile</title>
    <script>
        function redirectToMenu() {
            window.location.href = "profile_menu.jsp";
        }
    </script>
</head>
<body>
    <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>

    <%  
        int faculty_id = Integer.parseInt(request.getParameter("f_id"));
        String lastName = request.getParameter("last_name");
        String firstName = request.getParameter("first_name");
        String gender = request.getParameter("gender");
        String departmentName = request.getParameter("department_name");
        String positionName = request.getParameter("position_name");
        String dateofbirth = request.getParameter("date_of_birth");
        String mobileNumber = request.getParameter("mobile_number");
        String eligibility = request.getParameter("is_eligible");
      
      
        int status = S.modify_all(faculty_id, lastName, firstName, gender, 
        departmentName, positionName, dateofbirth, mobileNumber, eligibility);
       
        if (status == 1) {  
    %>  
            <h1>Update Successful!</h1><br> 

        <% } else { 
        %>
            <h1>Update Failed!</h1>
        <% } 
        %>
    
    <input type="button" value="Return" onclick="redirectToMenu()">
</body>
</html>