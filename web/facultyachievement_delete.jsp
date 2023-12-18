<%-- 
    Document   : facultyachievement_delete
    Created on : 11 20, 23, 2:38:03 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Faculty Decision</title>
    </head>
    <body>
        <form action="facultyachievement_delete_process.jsp" method="post">
        <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>

        <h2>Choose Achievement ID to delete</h2>  
        
        <% 
    // Call the registerAchievements method to populate the lists
    L.getID(); 
    
    // Now, you can use the populated lists to render HTML
        %>

        Achievement ID: <select id="achieve_id" name="achieve_id">
        <% 
            for (int i = 0; i < L.achievement_idList.size(); i++) { 
        %>
        <option value="<%= L.achievement_idList.get(i) %>"><%= L.achievement_idList.get(i) %></option>
        <% 
            } 
        %>
        </select><br>

  
        <input type="submit" value="Submit">
    </body>
</html>
