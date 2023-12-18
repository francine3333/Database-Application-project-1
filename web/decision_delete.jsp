<%-- 
    Document   : register_delete
    Created on : 11 19, 23, 2:14:57 AM
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
        <form action="decision_delete_ID.jsp" method="post">
        <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
        <h2>Choose Hiring_Id to delete</h2>  
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
