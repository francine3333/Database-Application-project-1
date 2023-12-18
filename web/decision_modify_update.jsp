<%-- 
    Document   : decision_modify_process
    Created on : 11 18, 23, 10:57:56 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Decision</title>
</head>
<body>
    <form action="decision_modify_process.jsp" method="post">
        <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
        
        <%
            int h_id = Integer.parseInt(request.getParameter("h_id"));
             F.modify_get(h_id); 
             F.view_decision_sID(h_id);
        %>
        
        <h2>Choose to modify</h2>     

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

        <input type="hidden" name="h_id" value="<%= h_id %>">
        <br>Hiring ID: <%= h_id %><br>
        Recruitment ID: <%= F.recruitment_id %><br>
        Department Name: <select id="department_name" name="department_name">
            <% for (int i = 0; i < F.department_namelist.size(); i++) { %>
                <option value="<%= F.department_namelist.get(i) %>"><%= F.department_namelist.get(i) %></option>
            <% } %>
        </select><br>

        Position Name: <select id="position_name" name="position_name">
            <% for (int i = 0; i < F.position_namelist.size(); i++) { %>
                <option value="<%= F.position_namelist.get(i) %>"><%= F.position_namelist.get(i) %></option>
            <% } %>
        </select><br>
        
        Academic Activity:<input type="text" id="acad_act" name="acad_act" value="<%= F.acad_acts %>"><br>
Responsibilities:<input type="text" id="responsibility" name="responsibility" value="<%= F.responsibility %>"><br>
        
        Academic Year: <select id="year" name="year">
            <% for (int i = 0; i < F.year_list.size(); i++) { %>
                <option value="<%= F.year_list.get(i) %>"><%= F.year_list.get(i) %></option>
            <% } %>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
