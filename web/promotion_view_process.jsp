<%-- 
    Document   : promotion_view_process
    Created on : 11 20, 23, 12:39:18 AM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Faculty Promotion</title>
    </head>
    <body>
        <%-- Retrieve and Display Faculty Report based on the selected Academic Year --%>
    <jsp:useBean id="P" class="facultymgt.faculty_promotion" scope="session"/>
    
    <%
        String selected = request.getParameter("ach_id");
        P.view_promotion();
    %>

    <% if ("all".equals(selected)) { %>     
    <h2>View Faculty Promotion</h2>  
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
                    <td colspan="6">No data available for the selected evaluation.</td>
                </tr>
            <% } %>
            <tr>
                <td colspan="6">
                    <input type="button" value="Return to Promotion Menu" onclick="window.location.href='promotion_menu.jsp'">
                </td>
            </tr>
        </table>
    <% } else if ("specific id".equals(selected)) { %> 
    <h2>Select Evaluation ID</h2>  
        <form action="promotion_view_process_sID.jsp" method="post">
        Evaluation ID: 
        <select id="h_id" name="h_id">
            <% for (int i = 0; i < P.vevaluation_idlist.size(); i++) { %>
                <option value="<%= P.vevaluation_idlist.get(i) %>"><%= P.vevaluation_idlist.get(i) %></option>
            <% } %>
        </select>
        <br>
        <input type="submit" value="Submit">
        </form>
    <% } else { %>
        <input type="button" value="Return to Promotion Menu" onclick="window.location.href='promotion_menu.jsp'">
    <% } %>
    </body>
</html>

