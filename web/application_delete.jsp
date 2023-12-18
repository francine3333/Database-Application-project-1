<%-- 
    Document   : application_delete
    Created on : 11 21, 23, 7:48:19 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application delete</title>
    </head>
    <body>
        <form action="application_delete_ID.jsp" method="post">
        <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
        <h2>Choose Application Id to delete</h2>  
        <% 
            J.viewApplication(); 
        %>
            
        Applicant ID: <select id="a_id" name="a_id">
                <% 
                    for (int i = 0; i < J.applicant_idList.size(); i++) {  
                %>
                    <option value="<%= J.applicant_idList.get(i) %>"><%= J.applicant_idList.get(i) %></option>
                <% } %>
            </select><br>
        <input type="submit" value="Submit">
    </body>
</html>
