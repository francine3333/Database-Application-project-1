<%-- 
    Document   : decision_modify_choice_ID
    Created on : 11 20, 23, 8:41:00 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Faculty Decision</title>
    </head>
    <body>
        <form action="decision_modify_update.jsp" method="post">
        <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
        <h2>Choose Hiring ID to modify</h2>  
        <% 
            F.register_decision(); 
        %>
            
        Hiring ID: <select id="h_id" name="h_id">
                <% 
                    for (int i = 0; i < F.hiring_idlist.size(); i++) {  
                %>
                    <option value="<%= F.hiring_idlist.get(i) %>"><%= F.hiring_idlist.get(i) %></option>
                <% } %>
            </select><br>
        <input type="submit" value="Submit">
    </body>
</html>
