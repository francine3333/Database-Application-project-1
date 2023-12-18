<%-- 
    Document   : promotion_view
    Created on : 11 20, 23, 12:38:57 AM
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
            <form action="promotion_view_process.jsp" method="post">
            <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
            <h2>Choose to view</h2>  
            
             <% 
            P.modify(); 
            %>
            
            Select: <select id="ach_id" name="ach_id">
                <% 
                    for (int i = 0; i < P.view_list.size(); i++) {  
                %>
                     <option value="<%= P.view_list.get(i) %>"><%= P.view_list.get(i) %></option>
                <% } 
                %>
            </select><br>

             <input type="submit" value="Submit">
    </body>
</html>
