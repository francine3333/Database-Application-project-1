<%-- 
    Document   : facultyachievement_delete_process
    Created on : 11 21, 23, 11:30:21 PM
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
        <form action="achievement_menu.jsp" method="post">
            <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
            <%
                int achieveID = Integer.parseInt(request.getParameter("achieve_id"));
                
                int status = L.delete(achieveID);
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
