<%-- 
    Document   : promotion_modify_choice
    Created on : 11 20, 23, 12:26:21 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Faculty Promotion</title>
    </head>
    <body>
            <form action="promotion_modify_update.jsp" method="post">
            <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
            <h2>Choose Evaluation ID to modify</h2>  
            
             <% 
            P.register_promotion(); 
            %>
            
            Select: <select id="e_id" name="e_id">
                <% 
                    for (int i = 0; i < P.evaluation_idlist.size(); i++) {  
                %>
                     <option value="<%= P.evaluation_idlist.get(i) %>"><%= P.evaluation_idlist.get(i) %></option>
                <% } 
                %>
            </select><br>
            
             <input type="submit" value="Submit">
    </body>
</html>
