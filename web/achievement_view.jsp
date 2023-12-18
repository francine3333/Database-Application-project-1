<%-- 
    Document   : achievement_view
    Created on : 11 20, 23, 3:30:02 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Achievement view</title>
    </head>
    <body>
         <form action="achievement_view_process.jsp" method="post">
        <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
        <h2>Choose to view</h2>

        <%
            L.modify_ach();
        %>
       
        Select: <select id="view_list" name="view_list">
            <%
                for (int i = 0; i < L.view_list.size(); i++) {
            %>
                <option value="<%= L.view_list.get(i) %>"><%= L.view_list.get(i) %></option>
            <%
                }
            %>
        </select><br>

        <input type="submit" value="Submit">
    </form>
    </body>
</html>
