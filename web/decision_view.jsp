<%-- 
    Document   : decision_modify
    Created on : 11 18, 23, 10:03:39 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Faculty Decision</title>
    </head>
    <body>
            <form action="decision_view_process.jsp" method="post">
            <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
            <h2>Choose to view</h2>  
            
             <% 
            F.modify(); 
            %>
            
            Select: <select id="view_list" name="view_list">
                <% 
                    for (int i = 0; i < F.view_list.size(); i++) {  
                %>
                     <option value="<%= F.view_list.get(i) %>"><%= F.view_list.get(i) %></option>
                <% } 
                %>
            </select><br>
            
            
            
             <input type="submit" value="Submit">
    </body>
</html>
