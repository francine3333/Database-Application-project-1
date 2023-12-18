<%-- 
    Document   : register_decision
    Created on : 11 13, 23, 11:34:52 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, facultymgt.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Faculty Process</title>
</head>
<body>
    <form action="decision_menu.jsp" method="post">
        <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
        <%
            int recruitmentId = Integer.parseInt(request.getParameter("recruitment_id"));
            String departmentName = request.getParameter("department_name");
            String positionName = request.getParameter("position_name");
            String acad_act = request.getParameter("acad_act");
            String responsibility = request.getParameter("responsibility");
            String year = request.getParameter("year");

            if (acad_act == null || acad_act.isEmpty() || responsibility == null || responsibility.isEmpty()) {
        %>
            <h1>Registering Faculty Decision Failed!</h1>
        <%
            } else {
                int status = F.insertDecision(recruitmentId, departmentName, positionName, acad_act, responsibility, year);

                if (status == 1) {
        %>
            <h1>Registering Faculty Decision Successful!</h1><br>
        <% 
                } else { 
        %>
            <h1>Registering Faculty Decision Failed!</h1>
        <% 
                }
            }
        %>

        <input type="submit" value="Return to Menu">
    </form>
</body>
</html>