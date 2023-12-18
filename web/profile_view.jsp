<%-- 
    Document   : profile_view
    Created on : 11 20, 23, 1:19:28 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty View Menu</title>
    </head>
    <body>
            <form action="profile_view_process.jsp" method="post">
            <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
            <h2>Choose to view</h2>  
            
             <% 
            S.modify(); 
            %>
            
            Select: <select id="view_list" name="view_list">
                <% 
                    for (int i = 0; i < S.view_list.size(); i++) {  
                %>
                     <option value="<%= S.view_list.get(i) %>"><%= S.view_list.get(i) %></option>
                <% } 
                %>
            </select><br>

            <input type="submit" value="Submit">
    </body>
</html>
