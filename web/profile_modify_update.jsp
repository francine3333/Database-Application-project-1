<%-- 
    Document   : profile_modify_update
    Created on : 11 20, 23, 1:19:11 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify Faculty Profile</title>
</head>
<body>
    <form action="profile_modify_process.jsp" method="post">
        <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
        
        <%
            int f_id = Integer.parseInt(request.getParameter("f_id"));
             S.modify_get(f_id); 
             S.view_profile_sID(f_id);
        %>
        
        <h2>Choose to modify</h2>     

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
                    <td colspan="9">No data available for the selected faculty profile.</td>
                </tr>
            <% } %>
        </table>

        <input type="hidden" name="f_id" value="<%= f_id %>">
        <br>Faculty ID: <%= f_id %><br>
        Last Name:<input type="text" id="last_name" name="last_name" value="<%= S.last_name %>"><br>
        First Name:<input type="text" id="first_name" name="first_name" value="<%= S.first_name %>"><br>
        
        Gender: <select id="gender" name="gender">
            <% for (int i = 0; i < S.genderlist.size(); i++) { %>
                <option value="<%= S.genderlist.get(i) %>"><%= S.genderlist.get(i) %></option>
            <% } %>
        </select><br>
        
        Department Name: <select id="department_name" name="department_name">
            <% for (int i = 0; i < S.department_namelist.size(); i++) { %>
                <option value="<%= S.department_namelist.get(i) %>"><%= S.department_namelist.get(i) %></option>
            <% } %>
        </select><br>

        Position Name: <select id="position_name" name="position_name">
            <% for (int i = 0; i < S.position_namelist.size(); i++) { %>
                <option value="<%= S.position_namelist.get(i) %>"><%= S.position_namelist.get(i) %></option>
            <% } %>
        </select><br>
        Date of Birth: <input type="date" id="date_of_birth" name="date_of_birth" 
            <% 
                if (!S.date_of_birth.isEmpty()) { %>
                    value="<%= S.date_of_birthlist.get(0) %>"
            <% } %>
        </select><br>   
        
        Mobile Number:<input type="text" id="mobile_number" name="mobile_number" value="<%= S.mobile_number %>"><br>
        
        Eligibility: <select id="is_eligible" name="is_eligible">
            <% for (int i = 0; i < S.is_eligiblelist.size(); i++) { %>
                <option value="<%= S.is_eligiblelist.get(i) %>"><%= S.is_eligiblelist.get(i) %></option>
            <% } %>
        </select><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
