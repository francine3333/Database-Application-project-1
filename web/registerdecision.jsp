<%-- 
    Document   : registerdecision
    Created on : 11 14, 23, 10:34:57 PM
    Author     : ccslearner
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Register Decision</title>
    </head>
        <body>
             <form action="registerdecision_processing.jsp" method="post">
            <jsp:useBean id="F" class="facultymgt.faculty_decision" scope="session"/>
            <h2>Register Faculty Decision</h2>  
             <% 
            F.register_decision(); 
            %>
        
             Hiring ID: <%= F.hiring_id %><br>
       
            Recruitment ID: <select id="recruitment_id" name="recruitment_id">
                <% 
                    for (int i = 0; i < F.recruitment_idlist.size(); i++) {  
                %>
                     <option value="<%= F.recruitment_idlist.get(i) %>"><%= F.recruitment_idlist.get(i) %></option>
                <% } 
                %>
            </select><br>

            Department Name: <select id="department_name" name="department_name">
                <% 
                    for (int i = 0; i < F.department_namelist.size(); i++) {  
                %>
                    <option value="<%= F.department_namelist.get(i) %>"><%= F.department_namelist.get(i) %></option>

                <% } 
                %>
            </select><br>

            Position Name: <select id="position_name" name="position_name">
                <% 
                    for (int i = 0; i < F.position_namelist.size(); i++) {  
                %>
                    <option value="<%= F.position_namelist.get(i) %>"><%= F.position_namelist.get(i) %></option>

                <% } 
                %>
            </select><br>
           Academic Activity:<input type="text" id="acad_act" name="acad_act"><br>
           Responsibilities:<input type="text" id="responsibility" name="responsibility"><br>
            
           Academic Year: <select id="year" name="year">
                <% 
                    for (int i = 0; i < F.year_list.size(); i++) {  
                %>
                    <option value="<%= F.year_list.get(i) %>"><%= F.year_list.get(i) %></option>

                <% } 
                %>
             </select><br>
            <input type="submit" value="Submit">
    </body>
</html>