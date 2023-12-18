<%-- 
    Document   : application_delete_process
    Created on : 11 21, 23, 7:48:45 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application delete process</title>
    </head>
    <body>
          <form action="L_application_decision.jsp" method="post">
            <jsp:useBean id="J" class="facultymgt.application" scope="session"/>
            <%
                int a_id = Integer.parseInt(request.getParameter("a_id"));
                
                int status = J.deleteApplication(a_id);
            if (status == 1) {  
            %>  
                <h1>Application Delete Successful!</h1><br>
            <% } else { 
            %>
                <h1>Application Delete Failed!</h1>
            <% } 
            %>

            <input type="submit" value="Return to Menu">
            </form>
    </body>
</html>
