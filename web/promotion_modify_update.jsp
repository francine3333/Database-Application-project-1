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
    <title>Modify Faculty Promotion</title>
</head>
<body>
    <form action="promotion_modify_process.jsp" method="post">
        <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
        
        <% 
            int e_id = Integer.parseInt(request.getParameter("e_id"));
            P.modify_get(e_id); 
            P.view_promotion_sID(e_id);
        %>
        
        <h2>Choose to modify</h2>     
        <table border="1">
            <tr>
                <th>Evaluation ID</th>
                <th>Faculty ID</th>
                <th>Achievement ID</th>
                <th>Qualifications</th>
                <th>Promotion Status</th>
                <th>Transaction Date</th>
            </tr>
            <% for (int i = 0; i < P.vevaluation_idlist.size(); i++) { %>
                <tr>
                    <td><%= P.vevaluation_idlist.get(i) %></td>
                    <td><%= P.vfaculty_idlist.get(i) %></td>
                    <td><%= P.vachievement_idlist.get(i) %></td>
                    <td><%= P.vqualificationslist.get(i) %></td>
                    <td><%= P.vpromotion_statuslist.get(i) %></td>
                    <td><%= P.vtransaction_datelist.get(i) %></td>
                </tr>
            <% } %>
            <% if (P.vevaluation_idlist.isEmpty()) { %>
                <tr>
                    <td colspan="6">No data available for the selected academic year.</td>
                </tr>
            <% } %>
        </table>
        
        <input type="hidden" name="e_id" value="<%= e_id %>">
        <br>Evaluation ID: <%= e_id %><br>
        Faculty ID: <%= P.faculty_id %><br>
        Achievement ID: <%= P.achievement_id %><br>
    
        Qualifications:<input type="text" id="quali" name="quali" value="<%= P.qualifications %>"><br>
        
        Promotion Status: <select id="p_s" name="p_s">
            <% for (int i = 0; i < P.promotion_statuslist.size(); i++) { %>
                <option value="<%= P.promotion_statuslist.get(i) %>"><%= P.promotion_statuslist.get(i) %></option>
            <% } %>
        </select><br>
        
            Transaction Date: <input type="date" id="transaction_date" name="transaction_date" 
            <% 
                if (P.transaction_date != null && !P.transaction_date.isEmpty()) { %>
                value="<%= P.transaction_datelist.get(0) %>"
            <% } %>
        >


            <br><input type="submit" value="Submit">
    </form>
</body>
</html>
