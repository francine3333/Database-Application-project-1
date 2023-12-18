<%-- 
    Document   : register_achievement_processing
    Created on : 11 20, 23, 5:47:08 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Faculty Achievement</title>
    </head>
    <body>
        
         <form action="achievement_menu.jsp" method="post">
        <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
                   
        <%
        
        int facultyId = Integer.parseInt(request.getParameter("faculty_id"));
        String achievementDescription = request.getParameter("achievement_description");
        String contribution = request.getParameter("contribution");
        String projectName = request.getParameter("project_name");
        
        L.faculty_id = Integer.valueOf(facultyId);
        L.achievement_description = achievementDescription;
        L.contribution = contribution;
        L.project_name = projectName;
        
        // Call the method to insert achievement
        int status = L.insertAchievement(facultyId, achievementDescription, contribution, projectName);
        
        // Use the status to display a message
        if (status == 1) {
    %>
                <h1>Achievement Registered Successfully!</h1><br>
    <%
            } else {
    %>
                <h1>Failed to Register Achievement!</h1>
    <%
            }
        
    %>

          <input type="submit" value="Return to Menu">
        </form>
        
    </body>
</html>
