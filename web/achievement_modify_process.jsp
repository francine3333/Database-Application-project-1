<%-- 
    Document   : achievement_modify_process
    Created on : 11 19, 23, 9:35:10 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Achievement</title>
</head>
<body>
     <form action="achievement_menu.jsp" method="post">
    <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
    
    <% 
        int achievementId = Integer.parseInt(request.getParameter("h_id"));
        String newDescription = request.getParameter("achievement_description");
        String newContribution = request.getParameter("contribution");
        String newProjectName = request.getParameter("project_name");
        
        L.achievement_id = achievementId;
        L.achievement_description = newDescription;
        L.contribution = newContribution;
        L.project_name = newProjectName;
        
        L.modify_ach();
        
        int status = L.modifyAll(achievementId, newDescription, newContribution, newProjectName);
        
        if (status == 1) {  
    %>  
            <h1>Update Successful!</h1><br>
        <% } else { 
        %>
            <h1>Update Failed!</h1>
        <% } 
        %>
        
        <!-- Handle other cases or provide an else statement -->
        
            <input type="submit" value="Return">
    </body>
</html>
