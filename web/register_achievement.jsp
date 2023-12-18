<%-- 
    Document   : register_achievement
    Created on : 11 20, 23, 5:27:29 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Faculty Achievement</title>
    </head>
    <body>
        
        <form action="register_achievement_processing.jsp" method="post">
            <jsp:useBean id="L" class="facultymgt.achievement" scope="session"/>
            <h2>Register Faculty Achievement</h2>  
             <%
         L.registerAchievements();
         %>
         
         Achievement ID: <%= L.achievement_id %><br>
         
         Faculty ID: <select id="faculty_id" name="faculty_id">
                <% 
                    for (int i = 0; i < L.faculty_idList.size(); i++) {  
                %>
                <option value="<%= L.faculty_idList.get(i) %>"><%= L.faculty_idList.get(i) %><br></option>
                <% } 
                %>
        </select><br>
         Achievement Description:<input type="text" id="achievement_description" name="achievement_description"><br>
         Contribution:<input type="text" id="contribution" name="contribution"><br>
                
        Project name:<input type="text" id="project_name" name="project_name"><br>
              
       </select><br>
           <input type="submit" value="Submit">
    </body>
</html>