<%-- 
    Document   : promotion_delete_process
    Created on : 11 20, 23, 12:32:04 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Faculty Promotion</title>
    </head>
    <body>
       <form action="promotion_menu.jsp" method="post">
            <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
            <%
                int e_id = Integer.parseInt(request.getParameter("e_id"));
                
                int status = P.delete(e_id);
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
