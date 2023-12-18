<%-- 
    Document   : profile_delete_process
    Created on : 11 20, 23, 1:18:16 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Faculty Profile</title>
    </head>
    <body>
         <form action="profile_menu.jsp" method="post">
            <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
            <%
                int faculty_id = Integer.parseInt(request.getParameter("f_id"));
                
                int status = S.delete(faculty_id);
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
