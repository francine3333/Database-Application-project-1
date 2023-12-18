<%-- 
    Document   : achievement_menu
    Created on : 11 15, 23, 11:50:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Achievement Menu</title>
    </head>
    <body>
            <h2>Faculty Achievement Menu</h2>  
           <a href="register_achievement.jsp">            Add Faculty Achievement</a><br>
           <a href="achievement_modify_choice.jsp">        Modify Faculty Achievement</a><br>
           <a href="facultyachievement_delete.jsp">          Delete Faculty Achievement</a><br>
            <a href="achievement_view.jsp">         View Faculty Achievement</a><br>
            <br><input type="button" value="Return to Admin Menu" onclick="window.location.href='faculty_admin.html'">
    </body>
</html>
