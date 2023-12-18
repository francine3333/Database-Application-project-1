<%-- 
    Document   : decision_menu
    Created on : 11 15, 23, 11:50:38 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Decision Menu</title>
    </head>
    <body>
            <h2>Faculty Decision Menu</h2>  
           <a href="registerdecision.jsp">            Add Faculty Decision</a><br>
           <a href="decision_modify_choice_ID.jsp">        Modify Faculty Decision </a><br>
           <a href="decision_delete.jsp">          Delete Faculty Decision </a><br>
            <a href="decision_view.jsp">         View Faculty Decision </a><br>
            <br><input type="button" value="Return to Admin Menu" onclick="window.location.href='faculty_admin.html'">
    </body>
</html>
