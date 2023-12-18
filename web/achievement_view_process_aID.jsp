a<%-- 
    Document   : achievement_view_process_aID
    Created on : 11 20, 23, 3:31:08 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achievement View Menu</title>
    </head>
    <body>
        <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
    
    <% 
        int achieve_id = Integer.parseInt(request.getParameter("achieve_id"));
        L.viewAchievementByID(achieve_id);
    %>
    <h2>View Faculty Achievement</h2>  
    <table border="1">
        <tr>
            <th>Achievement ID</th>
            <th>Faculty ID</th>
            <th>Achievement Description</th>
            <th>Contribution</th>
            <th>Project Name</th>
        </tr>
        <% for (int i = 0; i < L.dachievement_idList.size(); i++) { %>
            <tr>
                <td><%= L.dachievement_idList.get(i) %></td>
                <td><%= L.dfaculty_idList.get(i) %></td>
                <td><%= L.dachievement_descriptionList.get(i) %></td>
                <td><%= L.dcontributionList.get(i) %></td>
                <td><%= L.dproject_nameList.get(i) %></td>
            </tr>
        <% } %>
        <% if (L.dachievement_idList.isEmpty()) { %>
            <tr>
                <td colspan="5">No data available for the selected achievement ID.</td>
            </tr>
        <% } %>
        <tr>
            <td colspan="5">
                <input type="button" value="Return to Achievement Menu" onclick="window.location.href='achievement_menu.jsp'">
            </td>
        </tr>
    </table>
    </body>
</html>
