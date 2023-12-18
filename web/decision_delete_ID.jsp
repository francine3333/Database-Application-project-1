<%-- 
    Document   : decision_delete_ID
    Created on : 11 20, 23, 8:13:07 PM
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
         <form action="decision_delete_process.jsp" method="post">
        <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
        
         <% 
        int h_id = Integer.parseInt(request.getParameter("h_id"));
        F.view_decision_sID(h_id);
    %>
    <input type="hidden" name="h_id" value="<%= h_id %>">
    <h2>Faculty Decision Delete</h2>  
    <table border="1">
        <tr>
            <th>Hiring ID</th>
            <th>Recruitment ID</th>
            <th>Department Name</th>
            <th>Position Name</th>
            <th>Academic Activities</th>
            <th>Responsibilities</th>
            <th>Academic Year</th>
        </tr>
        <% for (int i = 0; i < F.vhiring_idlist.size(); i++) { %>
            <tr>
                <td><%= F.vhiring_idlist.get(i) %></td>
                <td><%= F.vrecruit_idlist.get(i) %></td>
                <td><%= F.vdept_namelist.get(i) %></td>
                <td><%= F.vpos_namelist.get(i) %></td>
                <td><%= F.vacad_actlist.get(i) %></td>
                <td><%= F.vresp_list.get(i) %></td>
                <td><%= F.vacad_yearlist.get(i) %></td>
            </tr>
        <% } %>
      <% if (F.vhiring_idlist.isEmpty()) { %>
            <tr>
                <td colspan="7">No data available for the selected academic year.</td>
            </tr>
        <% } %>
    </table>
    

    <br><input type="submit" value="Delete">
</form>
    </body>
</html>
