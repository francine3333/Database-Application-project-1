<%-- 
    Document   : decision_delete_process
    Created on : 11 19, 23, 2:18:23 AM
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
         <form action="decision_menu.jsp" method="post">
            <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
            <%
                int h_id = Integer.parseInt(request.getParameter("h_id"));
                
                int status = F.delete(h_id);
            if (status == 1) {  
            %>  
                <h1>Faculty Delete Successful!</h1><br>
            <% } else { 
            %>
                <h1>Faculty Delete Failed!</h1>
            <% } 
            %>

            <input type="submit" value="Return to Menu">
            </form>
    </body>
</html>
