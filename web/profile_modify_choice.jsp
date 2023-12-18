<%-- 
    Document   : profile_modify_choice
    Created on : 11 20, 23, 1:18:40 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Faculty_Profile</title>
    </head>
    <body>
        <form action="profile_modify_update.jsp" method="post">
        <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
        <h2>Choose Faculty ID to modify</h2>  
        <% 
            S.register_profile(); 
        %>
            
        Faculty ID: <select id="f_id" name="f_id">
                <% 
                    for (int i = 0; i < S.faculty_idlist.size(); i++) {  
                %>
                    <option value="<%= S.faculty_idlist.get(i) %>"><%= S.faculty_idlist.get(i) %></option>
                <% } %>
            </select><br>
        <input type="submit" value="Submit">
    </body>
</html>
