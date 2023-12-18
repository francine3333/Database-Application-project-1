<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Faculty Decision</title>
</head>
<body>
    <%-- Retrieve and Display Faculty Report based on the selected Academic Year --%>
    <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
    
    <%
        String selected = request.getParameter("view_list");
        F.view_decision();
    %>

    <% if ("all".equals(selected)) { %>     
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
    <% } else if ("specific id".equals(selected)) { %> 
    <h2>Select Hiring ID</h2>  
        <form action="decision_view_process_sID.jsp" method="post">
        Hiring ID: 
        <select id="h_id" name="h_id">
            <% for (int i = 0; i < F.vhiring_idlist.size(); i++) { %>
                <option value="<%= F.vhiring_idlist.get(i) %>"><%= F.vhiring_idlist.get(i) %></option>
            <% } %>
        </select>
        <br>
        <input type="submit" value="Submit">
        </form>
    <% } else { %>
        <input type="button" value="Return to Decision Menu" onclick="window.location.href='decision_menu.jsp'">
    <% } %>
</body>
</html>
