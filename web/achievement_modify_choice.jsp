<%-- 
    Document   : achievement_modify_choice
    Created on : 11 20, 23, 8:41:00 PM
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
        <form action="achievement_modify_update.jsp" method="post">
        <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
        <h2>Choose Achievement ID to modify</h2>  
        <% 
            L.getID(); 
        %>
            
        Achievement ID: <select id="h_id" name="h_id">
                <% 
                    for (int i = 0; i < L.achievement_idList.size(); i++) {  
                %>
                    <option value="<%= L.achievement_idList.get(i) %>"><%= L.achievement_idList.get(i) %></option>
                <% } %>
            </select><br>
        <input type="submit" value="Submit">
    </body>
</html>
