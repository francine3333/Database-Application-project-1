<%-- 
    Document   : decision_view_process_sID
    Created on : 11 19, 23, 9:47:07 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Faculty Decision</title>
    </head>
    <body>
    <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
    
    <% 
        int h_id = Integer.parseInt(request.getParameter("h_id"));
        F.view_decision_sID(h_id);
    %>
    <h2>View Faculty Decision</h2>  
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
        <tr>
            <td colspan="7">
                <input type="button" value="Return to Decision Menu" onclick="window.location.href='decision_menu.jsp'">
            </td>
        </tr>
    </table>
    </body>
</html>
