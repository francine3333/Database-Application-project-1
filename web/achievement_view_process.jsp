<%-- 
    Document   : achievement_view_process
    Created on : 11 20, 23, 3:30:32 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achievement view process</title>
    </head>
    <body>
        <%-- Retrieve and Display Achievement Report based on the selected option --%>
    <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
    
    <%
        String selected = request.getParameter("view_list");
        L.viewAchievement();
        L.getID();
    %>
    
    <% if ("all".equals(selected)) { %>     
    <h2>View Faculty Achievements</h2>  
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
                    <td colspan="5">No data available for the selected option.</td>
                </tr>
            <% } %>
            <tr>
                <td colspan="5">
                    <input type="button" value="Return to Achievement Menu" onclick="window.location.href='achievement_menu.jsp'">
                </td>
            </tr>
        </table>
    <% } else if ("specific id".equals(selected)) { %> 
    <h2>Select Achievement ID</h2>  
        <form action="achievement_view_process_aID.jsp" method="post">
            
        Achievement ID: 
        <select id="achieve_id" name="achieve_id">
            <% for (int i = 0; i < L.achievement_idList.size(); i++) { %>
                <option value="<%= L.achievement_idList.get(i) %>"><%= L.achievement_idList.get(i) %></option>
            <% } %>
        </select>
        <br>
        <input type="submit" value="Submit">
        </form>
    <% } else { %>
        <input type="button" value="Return to Achievement Menu" onclick="window.location.href='achievement_decision.html">
    <% } %>
    </body>
</html>
