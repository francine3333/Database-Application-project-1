<%-- 
    Document   : registerprofile
    Created on : 11 20, 23, 1:28:50 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Register Profile</title>
    </head>
        <body>
             <form action="registerprofile_processing.jsp" method="post">
            <jsp:useBean id="S" class="facultymgt.faculty_profile" scope="session"/>
            <h2>Register Faculty Profile</h2> 
             <% 
            S.register_profile(); 
            %>
        
            Faculty ID: <%= S.faculty_id %><br>
            Last Name: <input type="text" id="last_name" name="last_name"><br>
            First Name:<input type="text" id="first_name" name="first_name"><br>
       
            Gender: <select id="gender" name="gender">
                <% 
                    for (int i = 0; i < S.genderlist.size(); i++) {  
                %>
                     <option value="<%= S.genderlist.get(i) %>"><%= S.genderlist.get(i) %></option>
                <% } 
                %>
            </select><br>

            Department Name: <select id="department_name" name="department_name">
                <% 
                    for (int i = 0; i < S.department_namelist.size(); i++) {  
                %>
                    <option value="<%= S.department_namelist.get(i) %>"><%= S.department_namelist.get(i) %></option>

                <% } 
                %>
            </select><br>

            Position Name: <select id="position_name" name="position_name">
                <% 
                    for (int i = 0; i < S.position_namelist.size(); i++) {  
                %>
                    <option value="<%= S.position_namelist.get(i) %>"><%= S.position_namelist.get(i) %></option>

                <% } 
                %>
            </select><br>
           Date of Birth: <input type="date" id="date_of_birth" name="date_of_birth" 
                      <% if (!S.date_of_birthlist.isEmpty()) { %>
                          value="<%= S.date_of_birthlist.get(0) %>"
                      <% } %> ><br>
           Mobile Number:<input type="text" id="mobile_number" name="mobile_number"><br>
           
           Eligibility: <select id="is_eligible" name="is_eligible">
                <% 
                    for (int i = 0; i < S.is_eligiblelist.size(); i++) {  
                %>
                    <option value="<%= S.is_eligiblelist.get(i) %>"><%= S.is_eligiblelist.get(i) %></option>

                <% } 
                %>
            </select><br>

            <input type="submit" value="Submit">
    </body>
</html>
