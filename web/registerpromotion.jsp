<%-- 
    Document   : registerpromotion
    Created on : 11 18, 23, 1:52:19 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Register Promotion</title>
    </head>
        <body>
             <form action="registerpromotion_processing.jsp" method="post">
            <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
            <h2>Register Faculty Promotion</h2> 
            <% 
            P.register_promotion(); 
            %>
        
            Evaluation ID: <%= P.evaluation_id %><br>
       
            Faculty ID: <select id="faculty_id" name="faculty_id">
                <% 
                    for (int i = 0; i < P.faculty_idlist.size(); i++) {  
                %>
                     <option value="<%= P.faculty_idlist.get(i) %>"><%= P.faculty_idlist.get(i) %></option>
                <% } 
                %>
            </select><br>

            Achievement ID: <select id="achievement_id" name="achievement_id">
                <% 
                    for (int i = 0; i < P.achievement_idlist.size(); i++) {  
                %>
                     <option value="<%= P.achievement_idlist.get(i) %>"><%= P.achievement_idlist.get(i) %></option>
                <% } 
                %>
            </select><br>
            
           Qualifications:<input type="text" id="qualifications" name="qualifications"><br>
            
            Promotion Status: <select id="promotion_status" name="promotion_status">
                <% 
                    for (int i = 0; i < P.promotion_statuslist.size(); i++) {  
                %>
                     <option value="<%= P.promotion_statuslist.get(i) %>"><%= P.promotion_statuslist.get(i) %></option>
                <% } 
                %>
            </select><br>
            
            Transaction Date: <input type="date" id="transaction_date" name="transaction_date" 
                <% if (!P.transaction_datelist.isEmpty()) { %>
                          value="<%= P.transaction_datelist.get(0) %>"
                <% } %> ><br>
            <input type="submit" value="Submit">
    </body>
</html>
