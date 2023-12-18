<%-- 
    Document   : decision_modify_ki
    Created on : 11 18, 23, 11:56:15 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Decision</title>
    <script>
        function redirectToMenu() {
            window.location.href = "decision_menu.jsp";
        }
    </script>
</head>
<body>
    <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>

    <%  
        int hiring_id = Integer.parseInt(request.getParameter("h_id"));
        String departmentName = request.getParameter("department_name");
        String positionName = request.getParameter("position_name");
        String acad_act = request.getParameter("acad_act");
        String responsibility = request.getParameter("responsibility");
        String year = request.getParameter("year");
      
        F.view_decision_sID(hiring_id);
        F.hiring_id = hiring_id;
        F.department_name = departmentName;
        F.position_name = positionName;
        F.acad_acts = acad_act;
        F.responsibility = responsibility;
        F.year = year;
       
        int status = F.modify_all(hiring_id, departmentName, positionName, acad_act, responsibility, year);
       
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
