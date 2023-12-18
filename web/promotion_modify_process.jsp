<%-- 
    Document   : decision_modify_ki
    Created on : 11 18, 23, 11:56:15 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Promotion</title>
    <script>
        function redirectToMenu() {
            window.location.href = "promotion_menu.jsp";
        }
    </script>
</head>
<body>
   <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>

    <% 
            int e_id = Integer.parseInt(request.getParameter("e_id"));
            P.modify_get(e_id);      
    %>
    
    <%  
        int eval_id = Integer.parseInt(request.getParameter("e_id"));
        String quali = request.getParameter("quali");
        String p_s = request.getParameter("p_s");
        String year = request.getParameter("transaction_date");
      
       
        int status = P.modify_all(eval_id, quali , p_s, year);
       
        if (status == 1) {  
    %>  
            <h1>Update Successful!</h1><br> 

        <% } else { 
        %>
            <h1>Update Failed!</h1>
        <% } 
        %>
    
    <input type="button" value="Return" onclick="redirectToMenu()">
</body>
</html>
