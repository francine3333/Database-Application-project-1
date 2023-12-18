<%-- 
    Document   : profile_view_process
    Created on : 11 20, 23, 1:20:15 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Faculty Profile</title>
</head>
<body>
    <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
    
    <%
        String selected = request.getParameter("view_list");
        S.view_profile();
    %>

    <% if ("all".equals(selected)) { %>     
    <h2>View Faculty Profile</h2>  
        <table border="1">
            <tr>
                <th>Faculty ID</th>
                <th>Last Name</th>
                <th>First Name</th>
                <th>Gender</th>
                <th>Department Name</th>
                <th>Position Name</th>
                <th>Date of Birth</th>
                <th>Mobile Number</th>
                <th>Eligibility</th>
            </tr>
            <% for (int i = 0; i < S.vfaculty_idlist.size(); i++) { %>
                <tr>
                    <td><%= S.vfaculty_idlist.get(i) %></td>
                    <td><%= S.vlast_namelist.get(i) %></td>
                    <td><%= S.vfirst_namelist.get(i) %></td>
                    <td><%= S.vgenderlist.get(i) %></td>
                    <td><%= S.vdepartment_namelist.get(i) %></td>
                    <td><%= S.vposition_namelist.get(i) %></td>
                    <td><%= S.vdate_of_birthlist.get(i) %></td>
                    <td><%= S.vmobile_numberlist.get(i) %></td>
                    <td><%= S.vis_eligiblelist.get(i) %></td>

                </tr>
            <% } %>
            <% if (S.vfaculty_idlist.isEmpty()) { %>
                <tr>
                    <td colspan="9">No data available for the selected academic year.</td>
                </tr>
            <% } %>
            <tr>
                <td colspan="9">
                    <input type="button" value="Return to Profile Menu" onclick="window.location.href='profile_menu.jsp'">
                </td>
            </tr>
        </table>
    <% } else if ("specific id".equals(selected)) { %> 
    <h2>Select Faculty ID</h2>  
        <form action="profile_view_process_sID.jsp" method="post">
        Faculty ID: 
        <select id="f_id" name="f_id">
            <% for (int i = 0; i < S.vfaculty_idlist.size(); i++) { %>
                <option value="<%= S.vfaculty_idlist.get(i) %>"><%= S.vfaculty_idlist.get(i) %></option>
            <% } %>
        </select>
        <br>
        <input type="submit" value="Submit">
        </form>
    <% } else { %>
        <input type="button" value="Return to Profile Menu" onclick="window.location.href='profile_menu.jsp'">
    <% } %>
</body>
</html>
