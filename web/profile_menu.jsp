<%-- 
    Document   : profile_menu
    Created on : 11 20, 23, 1:17:08 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Profile Menu</title>
    </head>
    <body>
            <h2>Faculty Profile Menu</h2>  
           <a href="registerprofile.jsp">            Add Faculty Profile</a><br>
           <a href="profile_modify_choice.jsp">        Modify Faculty Profile </a><br>
           <a href="profile_delete.jsp">          Delete Faculty Profile </a><br>
            <a href="profile_view.jsp">         View Faculty Profile </a><br>
            <br><input type="button" value="Return to Admin Menu" onclick="window.location.href='faculty_admin.html'">
    </body>
</html>