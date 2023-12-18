<%-- 
    Document   : promotion_menu
    Created on : 11 20, 23, 12:23:55 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Promotion Menu</title>
    </head>
    <body>
            <h2>Faculty Promotion Menu</h2>  
           <a href="registerpromotion.jsp">            Add Faculty Promotion</a><br>
           <a href="promotion_modify_choice.jsp">        Modify Faculty Promotion </a><br>
           <a href="promotion_delete.jsp">          Delete Faculty Promotion</a><br>
            <a href="promotion_view.jsp">         View Faculty Promotion</a><br>
            <br><input type="button" value="Return to Admin Menu" onclick="window.location.href='faculty_admin.html'">
    </body>
</html>

