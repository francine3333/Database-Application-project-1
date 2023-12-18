<%-- 
    Document   : facultyachievement_delete_ID
    Created on : 11 21, 23, 11:35:55 PM
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
        
         <% 
        int achieveID = Integer.parseInt(request.getParameter("h_id"));
        L.viewAchievementByID(achieveID);
    %>
    <input type="hidden" name="achieveID" value="<%= achieveID %>">
    <h2>Faculty Decision Delete</h2>  
    <table border="1">
        <tr>
            <th>Achievement ID</th>
            <th>Faculty ID</th>
            <th>Achievement description</th>
            <th>Contribution</th>
            <th>Project name =</th>
           
        </tr>
        <% for (int i = 0; i < L.dachievement_idList.size(); i++) { %>
            <tr>
                <td><%= L.dachievement_idList.get(i) %></td>
                <td><%= L.dfaculty_idList.get(i) %></td>
                <td><%= L.achievement_descriptionList.get(i) %></td>
                <td><%= L.dcontributionList.get(i) %></td>
                <td><%= L.dproject_nameList.get(i) %></td>
         
            </tr>
        <% } %>
      <% if (L.dachievement_idList.isEmpty()) { %>
            <tr>
                <td colspan="7">No data available for the selected academic year.</td>
            </tr>
        <% } %>
    </table>
    

    <br><input type="submit" value="Delete">
</form>
    </body>
</html>
