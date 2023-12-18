<%-- 
    Document   : application_view
    Created on : 11 21, 23, 8:17:02 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application view</title>
    </head>
    <body>
        <form action="application_view_process.jsp" method="post">
            <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
            <h2>Choose to view</h2>  
            
             <% 
            J.modify();
            %>
            
            Select: <select id="view_list" name="view_list">
                <% 
                    for (int i = 0; i < J.view_list.size(); i++) {  
                %>
                     <option value="<%= J.view_list.get(i) %>"><%= J.view_list.get(i) %></option>
                <% } 
                %>
            </select><br>
            
            
            
             <input type="submit" value="Submit">
    </body>
</html>
